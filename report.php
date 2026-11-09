<?php
include "db.php";

$query = "SELECT 
            pe.vehicle_no, 
            v.owner_name, 
            ps.zone, 
            pe.slot_id, 
            pe.entry_time, 
            pe.exit_time
          FROM parking_entry pe
          JOIN vehicle v ON pe.vehicle_no = v.vehicle_no
          JOIN parking_slot ps ON pe.slot_id = ps.slot_id
          ORDER BY pe.entry_time DESC";

$result = mysqli_query($conn, $query);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Parking Report</title>
</head>
<body>
    <h2>Campus Parking Report</h2>
    <a href="parking.php">Record New Entry</a><br><br>
    
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr bgcolor="#f2f2f2">
                <th>Vehicle No</th>
                <th>Owner Name</th>
                <th>Zone</th>
                <th>Slot ID</th>
                <th>Entry Time</th>
                <th>Exit Time</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($result)): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['vehicle_no']); ?></td>
                        <td><?= htmlspecialchars($row['owner_name']); ?></td>
                        <td><?= htmlspecialchars($row['zone']); ?></td>
                        <td><?= htmlspecialchars($row['slot_id']); ?></td>
                        <td><?= htmlspecialchars($row['entry_time']); ?></td>
                        <td><?= $row['exit_time'] ? htmlspecialchars($row['exit_time']) : '<em>Parked (Active)</em>'; ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="6" align="center">No parking records found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>