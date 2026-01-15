Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2517A2EA;
	Thu, 15 Jan 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514248; cv=none; b=tlcV/m0k9Ot0g6lDfXJlCWkec29yAL/fm8LbgjfACwpLM+iaOUyJnwEuq2sjThZziltvS3njzXaeHyNKJnVYUTvHNwERxxd7GDh/YY9j9MB8Ure0+4Mo4C29zDttrS8el0IZNZhBwnDeMAtQS/icLrzsZBoecG90Tan4irIj/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514248; c=relaxed/simple;
	bh=dmb9pxb/DdDeE0oFuNsHGAvh/+naPbPX/6SjznaiaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IN0ApfGDdVVewdmgP/Q4/fitHK0vAw+Tqop4ZvBVnUczl5FCRNQw/7P0Jucy9cx6P0dqGJ/iZxQCq9gd9WryzKP+K8tsda5jn/XAON3ThyW0ewzADBpziDEQdixcl03D3sETdHqHDIQQGugKrzDSBQqlsWY4joDX8j7aH8o29uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUrt4iVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUrt4iVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F0BC116D0;
	Thu, 15 Jan 2026 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768514248;
	bh=dmb9pxb/DdDeE0oFuNsHGAvh/+naPbPX/6SjznaiaIw=;
	h=From:To:Cc:Subject:Date:From;
	b=JUrt4iVpk5xAVB7X7jA5dDzlc3IP/0Yhm9QenVxAMSoRgMN/dU0/BgCoBRh/A8rxw
	 lMy47CYmz9eOZte9AU3gjeoZwK52oO3PgU2cKI3M3eKRpUOd7w5lZPGzQ3Et/1kbYK
	 1JjEG/4lS4Xolbmr2lh6fCnPzmT2FtZxyWQ0dCg6dGTDPZ7h7fE507420Qbymo3mqu
	 AYTVf0MzwEbvBU1k6jmLGvyHfERiHamgeaQs2/wjUFfoZgRXgG09V3ggKMSfWRCk23
	 UmMZMeCQ59tH+tODHUsXPNLw1lua7k5dZhQn1hM9B/UDDFTr5t7/9bIKPakf0H435v
	 rczrZRcaRzKjA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] driver-core: improve driver binding documentation
Date: Thu, 15 Jan 2026 22:56:57 +0100
Message-ID: <20260115215718.6405-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver binding documentation (still) mentions that "When a driver is
attached to a device, the device is inserted into the driver's list of
devices.".

While it is true that the driver-core keeps track of all the devices
that are attached to a driver, this is purely for internal purposes
(i.e. it is an implementation detail) and has no relevance for user
facing documentation.

In fact, it is even misleading, since it could be read as if it were
valid for driver implementations to keep track of all the devices bound
to it.

Instead, drivers operate on a per-device basis, with a separate
per-device instance created when the driver is bound to a device.

Hence, remove the mention of a driver's list of devices and instead add
some documentation of the relationship between drivers and devices.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/driver-api/driver-model/binding.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/driver-model/binding.rst b/Documentation/driver-api/driver-model/binding.rst
index 7ea1d7a41e1d..d1d311a4011f 100644
--- a/Documentation/driver-api/driver-model/binding.rst
+++ b/Documentation/driver-api/driver-model/binding.rst
@@ -53,9 +53,12 @@ class's register_dev callback.
 Driver
 ~~~~~~
 
-When a driver is attached to a device, the device is inserted into the
-driver's list of devices.
-
+When a driver is attached to a device, the driver's probe() function is
+called. Within probe(), the driver initializes the device and allocates
+and initializes per-device data structures. This per-device state is
+associated with the device object for as long as the driver remains bound
+to it. Conceptually, this per-device data together with the binding to
+the device can be thought of as an instance of the driver.
 
 sysfs
 ~~~~~
-- 
2.52.0

