Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565C7405C59
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778903587; cv=none; b=auLq3Wf9JrsStuNCsikttgjb8KEoMhWiIjbo/pm1RaFvveRwWdqj5h59HHXzqT0ZbX7c7S0M4o5HFJN6TYky+YzTjFmgWM+qA1xR1wSrCU+eGydpQIHJwdmN7kXyKLlxt9qpFvdvxHOoo0UCcCxq7G+oDcJr2RZiWXnTFBeMlnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778903587; c=relaxed/simple;
	bh=Zh88LsjdS8b82WS8dFjlxBtfxA5gFqlVa8xpNBjfh4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JC6IH5QPt6ZvlH4ZRkolPlXTsuPyXgGlDOOLaAEKUNoaszLOpXG090VjABB2WQNI/n0NU8WM/fGkgP9/deJfCZAt4M+CRXvUlz5wwbZlAfyA+6gcnPHlvhvef+HxKOQSkiEPNdDkrpNDKi+tmM2nQy8WQSi2DeNWs9V7SQWxNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxS98qsT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxS98qsT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8383fb7143aso206360b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778903585; x=1779508385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jS0vSk6bmPfIusfXr5IMosg02PohFsEnHMQvJ941g6k=;
        b=SxS98qsTuwHbGpb6DvVM4HlVu+HNsLYf/b4Nn6agt/VR+4b+z0MpagoLIwl/x0aaM6
         QxinH3PHQF3qYJ9FcPE5DmPPk3lW75aunb0FxWMOtm00KNbWt1KYA0di14kxGiGBfjhp
         SWjGmuT7Xq3mPRRvU1kCG4U6Cy6f7UqXOg0MYjb+NBw1MDDVXO3z3J9kOnHSJxuv1vKk
         zAwxfw+WcP7Gt6qhDrulv5Yj36DB6q7gOm+qLIpyZ41tWUlgSROGGBNLa6vuz7UoTpkE
         0FzwL33ENDdVmKssisGpvzqI3KTcK7GaKaX8eHaBqh+qFwCGgVeqcTdR5dbAA0jMgPYr
         x/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778903585; x=1779508385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS0vSk6bmPfIusfXr5IMosg02PohFsEnHMQvJ941g6k=;
        b=VZWYtiHLutRnUvRtpoGboAXSSL5Dtq8eyyFapSLca+6iPtgOMD+HCpGeM2olZKUMxE
         YPS0dSBI3uK4V1KPPdzTbeUpciD6fO5M7gjLg8Xfc3H4ZKMCED18snvugk93DRHupUFA
         vXQ5ketsOTwExpd7d3hDc4DDNbQGPkOZGKGPDr3uzBwWpVFHytoLPkes5IQUQEb+2LCc
         CahIUmooa8dqkxEYVjw1GmvrIrN5bQhj0RrAtqUelI8bbhvpm3p7Cxq/vM2Q3XCJdyXq
         ObkLc7U9gVoG6/iYiyj9OLlcC157yz6kdSoVqtL+kxq5BbGOhFTr0mpe+mCzuWUwv08G
         oyIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UgIaw+u/oJJEX3FZoipPqZHjvGVj6MVsJ20V00Dzp9GUAfJqig9O7ggQd61ncMOnls+vHn1U0G58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJme/XitCF6dS0+fagAD6YAHuM+IvuwVsV4bGa8e1RGizY1JhJ
	++NbB0d5POhOkXOX5ENXoRYzJBtCoHOA4DbI1lSY5xTmPzeo6inujr3MG4SUAOWmxbA=
X-Gm-Gg: Acq92OETHmzmgfzbYPNDwSaN+FW/2JvZVw7lUpoM+PfVI6V8EiXA/eaqxfFzKyNNBLv
	c7DsklZVWwg88P/3c5PI2nlHkQE+bko1qJ4pfDWhWXszcgOXN+UFZsjhMYKTo9RBMAt+huWN+Xs
	/nfs4xSwvBp56oSdVwLqJ9KXBTxL6nKNCr3Lg8wBTJsZgEYnyxT6aiuweRn8Es1vd5j5Zpttu7h
	WSF0rQSyBg3PGLsganYplECGkpNXL6rV5W7W/+Xx4yOTqxIFG/YKlVaB/lIExcvCMCY5C+JtYKz
	vWuXYWhTn5ce5BtHxO6rjz8U2S3uB9lgWP8pxFiAbYOiLpstBVie1UIX26Jl8vTxtvq1AkEr1g+
	HmnJlv5FxbRX0N3mUjwa+wlNw7i07WDIg1I4q5MAGIYDrtpPLY3QArhZQ4ZP+6zl1Zp5Etfb8nf
	O9W8VLGprwnKHSAsm/DYaKUkVfV4jCWOOE1vLbABDWDvhfBZw6ZNlv9LThQLPXU2/+OtkkjGwec
	tQOcyMuQaxemDeS3wYqQsj/U66VO7/E6ALRVVgr5KOKJYJlkuTvZmuuGp4UKyk=
X-Received: by 2002:a05:6a20:e293:b0:39f:a42:924c with SMTP id adf61e73a8af0-3b22eba1aa3mr7452542637.17.1778903585380;
        Fri, 15 May 2026 20:53:05 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121cd6sm6939008a12.30.2026.05.15.20.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 20:53:04 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: adt7411: document supported sysfs attributes
Date: Sat, 16 May 2026 11:52:31 +0800
Message-ID: <20260516035245.1604-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adt7411 driver exposes additional standard hwmon attributes beyond
the ones currently listed in Documentation/hwmon/adt7411.rst.

Document voltage min/max/alarm attributes, temperature min/max and
min_alarm/max_alarm attributes, and the temp2_fault attribute for the
external temperature channel.

Also update the documentation to clarify that analog inputs in1 and in2
are not available when the external temperature sensor is enabled, and
remove the outdated statement claiming that external temperature support
and limit registers are unsupported.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/adt7411.rst | 37 +++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/adt7411.rst b/Documentation/hwmon/adt7411.rst
index 57ad16fb216a..28b6f3cb6b86 100644
--- a/Documentation/hwmon/adt7411.rst
+++ b/Documentation/hwmon/adt7411.rst
@@ -30,11 +30,36 @@ Check the datasheet for details.
 sysfs-Interface
 ---------------
 
-================ =================
-in0_input	 vdd voltage input
-in[1-8]_input	 analog 1-8 input
-temp1_input	 temperature input
-================ =================
+================    =================================
+in0_input           vdd voltage input
+in0_min             vdd low limit
+in0_max             vdd high limit
+in0_alarm           vdd alarm
+in[1-8]_input       analog 1-8 input
+in[1-8]_min         analog input low limit
+in[1-8]_max         analog input high limit
+in[1-8]_alarm       analog input alarm
+temp1_input         internal temperature input
+temp1_min           internal temperature low limit
+temp1_max           internal temperature high limit
+temp1_min_alarm     internal temperature low alarm
+temp1_max_alarm     internal temperature high alarm
+================    =================================
+
+If the external temperature sensor is enabled, the following attributes are
+also available:
+
+================ ================================================
+temp2_input      external temperature input
+temp2_min        external temperature low limit
+temp2_max        external temperature high limit
+temp2_min_alarm  external temperature low alarm
+temp2_max_alarm  external temperature high alarm
+temp2_fault      external temperature sensor fault
+================ ================================================
+
+If the external temperature sensor is enabled, analog inputs in1 and in2 are
+not available.
 
 Besides standard interfaces, this driver adds (0 = off, 1 = on):
 
@@ -47,4 +72,4 @@ Besides standard interfaces, this driver adds (0 = off, 1 = on):
 Notes
 -----
 
-SPI, external temperature sensor and limit registers are not supported yet.
+SPI is not supported yet.
-- 
2.53.0

