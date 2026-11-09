<?php
include "db.php";

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $vehicle_no = mysqli_real_escape_string($conn, $_POST['vehicle_no']);
    $slot_id = mysqli_real_escape_string($conn, $_POST['slot_id']);
    $entry_time = mysqli_real_escape_string($conn, $_POST['entry_time']);
    $exit_time = !empty($_POST['exit_time']) ? "'" . mysqli_real_escape_string($conn, $_POST['exit_time']) . "'" : "NULL";

    $sql = "INSERT INTO parking_entry (vehicle_no, slot_id, entry_time, exit_time) 
            VALUES ('$vehicle_no', '$slot_id', '$entry_time', $exit_time)";

    if (mysqli_query($conn, $sql)) {
        $message = "<p style='color: green;'>Parking entry recorded successfully!</p>";
    } else {
        $message = "<p style='color: red;'>Error: " . mysqli_error($conn) . "</p>";
    }
}

// Fetch existing vehicles and slots for dropdown selection
$vehicles = mysqli_query($conn, "SELECT vehicle_no, owner_name FROM vehicle");
$slots = mysqli_query($conn, "SELECT slot_id, zone, slot_type FROM parking_slot");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Record Parking Entry</title>
</head>
<body>
    <h2>Campus Parking Management - Record Entry</h2>
    <?= $message; ?>
    <form method="POST" action="parking.php">
        <label>Select Vehicle:</label><br>
        <select name="vehicle_no" required>
            <option value="">-- Select Registered Vehicle --</option>
            <?php while ($v = mysqli_fetch_assoc($vehicles)): ?>
                <option value="<?= htmlspecialchars($v['vehicle_no']); ?>">
                    <?= htmlspecialchars($v['vehicle_no']) . " (" . htmlspecialchars($v['owner_name']) . ")"; ?>
                </option>
            <?php endwhile; ?>
        </select><br><br>

        <label>Select Slot:</label><br>
        <select name="slot_id" required>
            <option value="">-- Select Slot --</option>
            <?php while ($s = mysqli_fetch_assoc($slots)): ?>
                <option value="<?= htmlspecialchars($s['slot_id']); ?>">
                    <?= htmlspecialchars($s['slot_id']) . " - " . htmlspecialchars($s['zone']) . " (" . htmlspecialchars($s['slot_type']) . ")"; ?>
                </option>
            <?php endwhile; ?>
        </select><br><br>

        <label>Entry Time:</label><br>
        <input type="datetime-local" name="entry_time" required><br><br>

        <label>Exit Time (optional):</label><br>
        <input type="datetime-local" name="exit_time"><br><br>

        <input type="submit" value="Save Parking Entry">
    </form>
    <br>
    <a href="report.php">Go to Parking Report</a>
</body>
</html>