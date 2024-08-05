Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020102.outbound.protection.outlook.com [52.101.171.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FFF49650
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722859460; cv=fail; b=QUgR7lG/dDKyq4RQR1Iwi5zPg9KvPO5QSuUwOiasMlc1udkRIou597tZJlOBFdAEOzyWxsyhgqBXzx5bgqHItFEvlg/IwQYOMOtTw2fUamVWScCbdjgU6ecmT0DNl1MqsfSHIej1YVZFtputVFe0DiZgJSdRV94hXj6Z+vSgh0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722859460; c=relaxed/simple;
	bh=KEuJkKy6H4+rDfp5qHcIg8sPgsyIcAII6fIBlSNxZC8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L1NB6Yy4cDIG9nEsmf90b7gmm+GEHo+ntvVdKbZV/eqDV9FokZZhscJ3PZM+eVs+N3KDL082h2VngGjhLGO3MgkKye/CotBZi19k6sXmCuT47UFbKy71+vPiH0DiYEIh32ypfjQu5fxjq2eWsXfL3A/osijWWo5o+DwmEwJv/1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=OdgcWUyq; arc=fail smtp.client-ip=52.101.171.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="OdgcWUyq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ascUIwyf8MzpA2CQnZJoGqvKvkfNb6SpqHYY1k/Rw2MCBRVm95WR4KwVpzXKJDj+bkeveFFIeaSz6QzN5ZhYDWTF0kJdUEh7Co8ETaL1cAaBhEmy55ZCjjPjpssSakUyKLTNquS0eXMoGzCQojxNoIxfukfQIGLY6Pte3vFn5+oAPMx6zs/9N9hXw+GTv3LXAA6yTtEkG4v8WkEyiN++LssVzM80YX1/quhG+UnxfPqgHSbb5Zr4U4An8umHZ8Q3p37e+G1q8ngrjj0epCuDhYFJhewQZH4y+k1ONY7qxfGiCfwiIU51LA0ZWnBFXhCrFQ/HktN2HJFT/veJ2+qaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OW6pUzhpIIGHZ5kZ+fLPD4gl25pYBuLwDy9qcDIsGE=;
 b=jqrohlu0qWAemeBUaflmO7Us8pMihUme6/aaEyXf5EWVk+B8hWV7OYKh2HUXHqZKWl9tWfW7GApYDdE3TiajeYTOK9gU04PbzHgKewWhEnIBmBjANsa47ad0DkAYTZIUNTSjhuJTQxGtBU9at4yKzXrZ/PifrKQOhpLXLQgPYb6jT9++Kr8CytWV57lBAf0E7POoXf3Y8xLP6/LgMUPAr8PULODS+/JaBMktbUw3h1vUtPVQ9ZD+ixBs/VcyeTZUslIZ+IdayN+TbTK8itCByimxwg+mqPJybiaQ6QWNniRYcwUwYpQfExVXIkp0m6et9fctrVcHnqxlUku8Dx+f/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OW6pUzhpIIGHZ5kZ+fLPD4gl25pYBuLwDy9qcDIsGE=;
 b=OdgcWUyqOhPMpCTpmfJKpFxHkaUT/4G7sekfDuwtnp/T0e/vKdwd7BoTvO2YpU/mgDEiKDfY6Z0UgMeOv/cWYtwPh7yXmCUUMTk7YPg077hBKIwQT0fVU/CPsna2W2MXgkot6qJHvT+V3DEEWx0P8U5f+qj8Emgu7995jsHEgBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by FR2P281MB2925.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:64::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 12:04:14 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%7]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 12:04:13 +0000
From: Thorsten Scherer <t.scherer@eckelmann.de>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Thorsten Scherer <t.scherer@eckelmann.de>
Subject: [PATCH] doc: iio: Fix sysfs paths
Date: Mon,  5 Aug 2024 14:03:47 +0200
Message-ID: <20240805120357.21135-1-t.scherer@eckelmann.de>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|FR2P281MB2925:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bdc20c-1ee2-4b15-3992-08dcb546b90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6eT3cUCe7eQq3CsQH6c+2167X1viRR5ENxXOhiwBXDAV1F2qu0OoCGxxnNDG?=
 =?us-ascii?Q?Vw9UaTLKTKIZapXKf9HeENCr4Aa/e48h9C/oZjR/+9DdKtMwdOYyIvyFWqvb?=
 =?us-ascii?Q?e6Os7jGnBFtnqY1gp/b+rp/3M39SIbB0+BWgsdIP3BV3BHssD8aYV3/8CMOf?=
 =?us-ascii?Q?alDQL4X5UM9e8zlFrvmhPFVmTbf7//2I+xHq6j/O6+U9Ke6nv0ySxrfIqW33?=
 =?us-ascii?Q?1S8HElJY72038HtS/tkTHOkD+3K8sxCK1GjS+CbIbdFziSAzMakcT42Y2y/V?=
 =?us-ascii?Q?fI3J2xKOED2uq+3BuQxpg+b6sIwNTc5EMWpJt59wPcdWzfMHrVnld+D4ksDI?=
 =?us-ascii?Q?Sd1yJkkfjF5t00T5O46B1nZka6MO0yuqWw23cshoYp7frdyDQYtX4HdHU8IU?=
 =?us-ascii?Q?HVHx+FPpuXY9qZHGjngGagqpnv3U1H6rKl3o9R4ZCHVux7h04hyX6wahiOVk?=
 =?us-ascii?Q?HGrxrRfSo7j3G9yLUBT7M0E3gOhTIX8zaf0qMP1PhH2K7ba1a2DIkk45F/Bq?=
 =?us-ascii?Q?akshPs2IYVl6Il4uJ+JeBSUMvLOYp6UHQABxv/6d9cyuzyIXuMvWiWQS91/A?=
 =?us-ascii?Q?3x2pXDWv0JnFDmO2bI/msWPuYjI6S4qWNIIbscHyqLEljC8Oe7Bgci/t37eH?=
 =?us-ascii?Q?jJbMD0MZKT0WwFsTRqXs80rymvTgWxTCmaHNd/NH2c/byqmzZKuIOYXiQ7Dd?=
 =?us-ascii?Q?DyvqNYwMqXY+yoC4tzWuSN7kZb36ALum1EHoSi1SPIOWdKOIAY8tjt5ObTYX?=
 =?us-ascii?Q?KyI1cqh2l49DG4T7wZ7PjtJt+yYF0ckftHHQZ/7bhAJxMdb6G+sEKuwmA9oZ?=
 =?us-ascii?Q?I0CFQhgPf/3B/AZyw2C1gt8Px2Dg2xJ23hWBnfYdvE3ZKfnzuX7cltduN6tE?=
 =?us-ascii?Q?+ybUPx/Nkb7TGhIDEstQTM/4hjbKg6ejhNVbXLEKTblNtAnVGzQ3BFms649t?=
 =?us-ascii?Q?Lr7jOt+5fZYzHORNJMxrWn+QI9Mi1rgNc++7DTFVtjwjavmx4UeZ50x1KIo6?=
 =?us-ascii?Q?xrdTk5VShznN64M9epYTznexsQZ9DSOh2T1U+YSZrLUvXArmstWC61yxbrM4?=
 =?us-ascii?Q?HwHEWf7VdsVNb2dneamF/QL9E0BnO0tP5UWSKqnBsAWS+MUVmYGP7p1Z4yRh?=
 =?us-ascii?Q?Ov5VQ4toxhloTuYAjFtKm1VUSoB5KFoQVYbwltVBSQpJxYs/jCj8KPeY/rKZ?=
 =?us-ascii?Q?AkeckDjps9XfpRbYmbaNlMgxp2c9mnoVngxNuhp/NHOhGFuB2BT0q3zQ4ilI?=
 =?us-ascii?Q?qDaR8x0qfnkIXklaza2d9Xl72uTSV3hLUyqRiWEyDVcsRbCNV6krC/MnO7Dz?=
 =?us-ascii?Q?IZwnJTRi2mdle69tFLuY3ECSXzI0mD3whCs0BJlueifREg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D0ntoaa+CkE73ndqKSAA1hos72YWqei16gV6NV4QJpJEhS4DVqzMpEUtFxOc?=
 =?us-ascii?Q?BEt6yey6goEQhGC/QWNP6GJpeQODiv4OKy0jZYZ3aKOEQ61hKZyKqZgVIyqp?=
 =?us-ascii?Q?rzkvh3azgRAYg1l504NQmk5+hENOpYEEVAOPUYDsXoxnMnVcXNWYwnNj8pw0?=
 =?us-ascii?Q?DilAlfTtbQdJBlgSY47QPY5CGjhoMb5i9epWMchuZh1+nZ0HnaI/XWw8lp42?=
 =?us-ascii?Q?b3y7m83ffKp+8cTojp3Pi40YBvJ+c5LfBO9NsuSCzveTaughFljscFvneYo6?=
 =?us-ascii?Q?BtQoBJvNm5QgoEaN+O4CRMN/jfkQfz5Q9DHJLsWc2jmIT4RgES5Z1ZGPlF0f?=
 =?us-ascii?Q?japzjH5pXM8tRCHIQWL+gu+sAqmB4gnwUs2717RmkOp0I8aw9B1pXGGmlJXV?=
 =?us-ascii?Q?1yc68pc2esSWJkG3YeRA+P13TNc4DUUyuRbnOOymoiWTP66UBMpzdB6exEmf?=
 =?us-ascii?Q?8KJKXTOM0y8NjSSUHlZtmO4UNoRhlGQPkX0OM43GCcoBrZI2bwrvBcBvx02u?=
 =?us-ascii?Q?0Pp71BF8pjImm2z71H/AXgcuns9wVGAT95igdUEuWyEpBGqfeKKXNbukGD43?=
 =?us-ascii?Q?nsyt6sNqprCjfR1cmtFh3TDJkk/euDy25g89h87Z8gKnunheTAdo/9QU2Y3J?=
 =?us-ascii?Q?0SsUp/etJH9lAD2zHxZcpawHEimAfPMAHU7YTU0XPN+UQD7wWWrFGXG4klnR?=
 =?us-ascii?Q?oVJtr0CjLAkaWRBnML8uPyL3D8gIjbrA1fywqS1vZrQmvo9Qi/aDEbU3AnrW?=
 =?us-ascii?Q?zelK9oSoQzCEnbrTIUpOECDcojRTja4ZRjfnupDVKgh3qbX2xAJNbX7nUDqx?=
 =?us-ascii?Q?yaIRl9RZSsmZo8+iozrH9N2CxxP0DARw2k4SHlGDADswCKLEGjLmZmtVqJ+o?=
 =?us-ascii?Q?igLCyQDL0Xj39FIoeXn0tZowAjc3ugUMS7tCnIvJwUMei/peeP7IfDahe/a+?=
 =?us-ascii?Q?nSG3r+Oh8T2SXhv+MD3rIbg/rgKHT7HWL4tj39ZKTSwc5x2RuUbbcKY8F38a?=
 =?us-ascii?Q?r3rXy/6mzJQUV+7dJX1plVXdQYeG7HMulp4DU7nZHiUBPDiWU3dTUOaoj7HR?=
 =?us-ascii?Q?x94FoQfoJMgv2badVSrSBS8Nmg5C0iZGG+vLwt2KJRQDg2TiZCcN0dfraKeu?=
 =?us-ascii?Q?QQx7Nrn3Ht46u2UTljnL+F4xieQAnC3IZXXhLSzSyi0m2H9emdhPfg04QxZp?=
 =?us-ascii?Q?xNqjaK94j2Mwb6DThnoBXVSK9iMp3yBF5IqOrADNHuNgYIpiRMQh+qIEh1ae?=
 =?us-ascii?Q?FOg/7LBcWbe+mzaOu5AZQ4DkCtO8aLi5MunFfJ/xE9NUB8KKKDrsMjhhOmOP?=
 =?us-ascii?Q?6FKhpN8ohBMupAKDl2ahZDrfK1pAh6orbdMWqySq93wx/MP329a7xtn0TQdN?=
 =?us-ascii?Q?qV7wT6fAWLBvzhrxEhlFPC2QxnalMllhKD1V9F2A8UthMR3rLLCjBkVro7P+?=
 =?us-ascii?Q?Y/4zf2zWz8a+HD7ZE8ctaCumzKvGHW7Lc2v0j7SBgYXK+XeR0ax3n9FtTxY9?=
 =?us-ascii?Q?VVUZD/cv8XtYUyh0fLHJ550nrwooesHcUO7WmPTZ9eKkHz5wWUze0vwuJ1FC?=
 =?us-ascii?Q?P1xLOuByvos6qPa5nxY2OeGarB5gcJAecucBfUNtI1T61dKtpObWIBSrMi05?=
 =?us-ascii?Q?p95fiWLE/Kn8KsFKdJ3v81h0pAvKfTEmtJZYZjgovLXTr9qPOGfAvZMEefAB?=
 =?us-ascii?Q?uOpdUA=3D=3D?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bdc20c-1ee2-4b15-3992-08dcb546b90c
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 12:04:13.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tm5AMTWeuZfc7iZztX2A+3X9GEfurwQX6BGISSNfbb8GpbVSU0VnrazfRvZWtlEHGgLzX/S11wSbBOqIx2/DPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2925

Add missing 'devices' folder in the /sys/bus/iio path.

Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
---
 Documentation/driver-api/iio/buffers.rst |  8 ++++----
 Documentation/driver-api/iio/core.rst    | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
index e83026aebe97..63f364e862d1 100644
--- a/Documentation/driver-api/iio/buffers.rst
+++ b/Documentation/driver-api/iio/buffers.rst
@@ -15,8 +15,8 @@ trigger source. Multiple data channels can be read at once from
 IIO buffer sysfs interface
 ==========================
 An IIO buffer has an associated attributes directory under
-:file:`/sys/bus/iio/iio:device{X}/buffer/*`. Here are some of the existing
-attributes:
+:file:`/sys/bus/iio/devices/iio:device{X}/buffer/*`. Here are some of the
+existing attributes:
 
 * :file:`length`, the total number of data samples (capacity) that can be
   stored by the buffer.
@@ -28,8 +28,8 @@ IIO buffer setup
 The meta information associated with a channel reading placed in a buffer is
 called a scan element. The important bits configuring scan elements are
 exposed to userspace applications via the
-:file:`/sys/bus/iio/iio:device{X}/scan_elements/` directory. This directory contains
-attributes of the following form:
+:file:`/sys/bus/iio/devices/iio:device{X}/scan_elements/` directory. This
+directory contains attributes of the following form:
 
 * :file:`enable`, used for enabling a channel. If and only if its attribute
   is non *zero*, then a triggered capture will contain data samples for this
diff --git a/Documentation/driver-api/iio/core.rst b/Documentation/driver-api/iio/core.rst
index 715cf29482a1..dfe438dc91a7 100644
--- a/Documentation/driver-api/iio/core.rst
+++ b/Documentation/driver-api/iio/core.rst
@@ -24,7 +24,7 @@ then we will show how a device driver makes use of an IIO device.
 
 There are two ways for a user space application to interact with an IIO driver.
 
-1. :file:`/sys/bus/iio/iio:device{X}/`, this represents a hardware sensor
+1. :file:`/sys/bus/iio/devices/iio:device{X}/`, this represents a hardware sensor
    and groups together the data channels of the same chip.
 2. :file:`/dev/iio:device{X}`, character device node interface used for
    buffered data transfer and for events information retrieval.
@@ -51,8 +51,8 @@ IIO device sysfs interface
 
 Attributes are sysfs files used to expose chip info and also allowing
 applications to set various configuration parameters. For device with
-index X, attributes can be found under /sys/bus/iio/iio:deviceX/ directory.
-Common attributes are:
+index X, attributes can be found under /sys/bus/iio/devices/iio:deviceX/
+directory.  Common attributes are:
 
 * :file:`name`, description of the physical chip.
 * :file:`dev`, shows the major:minor pair associated with
@@ -140,16 +140,16 @@ Here is how we can make use of the channel's modifiers::
 This channel's definition will generate two separate sysfs files for raw data
 retrieval:
 
-* :file:`/sys/bus/iio/iio:device{X}/in_intensity_ir_raw`
-* :file:`/sys/bus/iio/iio:device{X}/in_intensity_both_raw`
+* :file:`/sys/bus/iio/devices/iio:device{X}/in_intensity_ir_raw`
+* :file:`/sys/bus/iio/devices/iio:device{X}/in_intensity_both_raw`
 
 one file for processed data:
 
-* :file:`/sys/bus/iio/iio:device{X}/in_illuminance_input`
+* :file:`/sys/bus/iio/devices/iio:device{X}/in_illuminance_input`
 
 and one shared sysfs file for sampling frequency:
 
-* :file:`/sys/bus/iio/iio:device{X}/sampling_frequency`.
+* :file:`/sys/bus/iio/devices/iio:device{X}/sampling_frequency`.
 
 Here is how we can make use of the channel's indexing::
 
-- 
2.39.2

