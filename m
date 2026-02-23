Received: from mx08-007fc201.pphosted.com (mx08-007fc201.pphosted.com [91.207.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6B1ACEDE;
	Mon, 23 Feb 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846596; cv=none; b=CGP4TYDHbapGfXVqxboqfz9puxgPNdIXwrNmidiGNTzsENLVEg1l4GEr8IWXO40rBwT1MhdccMTbCkfW1aARJmdkH8r2MfOPG2KF/RdtzfhU3BXRuYdbcCub+ZjYoYgLI2biXVsAa3Nby0jyV+b7ZhbMIvm06RMW6Hk5cm7Gzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846596; c=relaxed/simple;
	bh=oxFl4PoAqx7YUdTUv0y7BupZwpZjtn5xeK5UvZWPQGk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=slkW5UTbAwX8vSCf20HdN06SuxAZtQaIsMLZFW7NQkyV6rx/jh6ZyDMx8esOrJOV47egZEiEXvHnyt+2RH8pcQzmw31seZJVukZOmTQZ9L/D6WYVDEMU3DPJ/oOKLlbogUZVJpVLYa0EAah+DMuCbnFoI9NYmqP+pH0Qn76OUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (2048-bit key) header.d=cab.de header.i=@cab.de header.b=RUkBlseO; arc=none smtp.client-ip=91.207.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cab.de header.i=@cab.de header.b="RUkBlseO"
Received: from pps.filterd (m0456229.ppops.net [127.0.0.1])
	by mx08-007fc201.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NB1UDv3066866;
	Mon, 23 Feb 2026 12:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp-2025; bh=CqpwoGjLfHtoyJL/hsV1/+p3
	lBtiWRUIOOw8sOlMBbA=; b=RUkBlseOFx0nwa0dO5tGQ5E37sDOF3BViDaB4Nri
	QGEX+iIo2Y7HzU3L2vzaOZrqBs/MM9mdL8wietnMFOIZ4w9T9LooQGFqANbxLEyq
	0cvzu297J072Nh7OW3jVZa6zbb/SRLGgdn5bTa/Sw04MZYhGTJENOCUfxHpHaEKY
	OfqZwqbcAvvgeaH3EeZO0iolIhHqZkhxTH04y4c4zS1jtZnMAnsrlNBPQiOSugjj
	i/0GfnVzma9acR685FGGbbxcdmx0/N5hFRNQU8ZklTtOTq7pFNL4n7Mxdlob8yzc
	CT+ZPOniSVR6sZNsM6yt3Ec8Fqxa1d6+9w3fcp1ARxWwJA==
Received: from adranos.cab.de (adranos.cab.de [46.232.229.107])
	by mx08-007fc201.pphosted.com (PPS) with ESMTPS id 4cfspm8djj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 12:13:19 +0100 (CET)
Received: from KAN23-025.cab.de (10.100.0.16) by Adranos.cab.de (10.10.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 23 Feb
 2026 12:13:18 +0100
From: Markus Heidelberg <m.heidelberg@cab.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Shi <alexs@kernel.org>,
        Yanteng Si
	<si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
CC: Markus Heidelberg <m.heidelberg@cab.de>, Dongliang Mu <dzm91@hust.edu.cn>,
        Shuah Khan <skhan@linuxfoundation.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH] docs: dt: unittest: update to current unittest filenames
Date: Mon, 23 Feb 2026 12:12:03 +0100
Message-ID: <20260223111207.54640-1-m.heidelberg@cab.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Adranos.cab.de (10.10.1.54) To Adranos.cab.de (10.10.1.54)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX5m2dohKzn+x7
 KevsZ6iLO/MzNWUexxOwB1+w7NPUzrGgsaGKMBJSGbTLVcnVfk5XO2z+coy64AFrhYIqOgDAwfI
 8HEN9ctPKQiFognpVnB0dCOqb4vzkXlAO1VeAypM2DciXXAKsB1VKPc7VR8aTS96IAVj80/ZvMX
 s9nSQMmUtwStuOjgPftym/6cvVjvoEYQqzCStcfkIuE5LuWWxXdVgnug9R2OaZnEJo0fvTdjenW
 +Sxj3azc9FNA68qDQM9xu9qlPqmpepN6bGPsYL5mhfMmy8sWzsNvraUPZZ2MX9An0w1SIQInkPf
 Xpw0clqimcCC+21OZvpyWPfvmDfiz+Wfp3kUT9ytRhPTkPSgSuZ2FhY0nyS3jodSdGb5mFyyTO4
 wvJ8pvUQH1zYAX0YAOW/4EKbWLg5RX1mdvqOSAEzIFtbtOBKBKp75Y90+FhE/amg4Ubaj6Ama52
 IcwyyetGw84bcc27dZw==
X-Proofpoint-GUID: NNChiMEL02J-Q3ZQNuUw_jWHlMPnacJ_
X-Authority-Analysis: v=2.4 cv=SPNPlevH c=1 sm=1 tr=0 ts=699c364f cx=c_pps
 a=LmW7qmVeM6tFdl5svFU9Cg==:117 a=LmW7qmVeM6tFdl5svFU9Cg==:17
 a=qfRZnU_letMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cWcFGAZ52ywjfBe9x-Am:22 a=fhGH0ZMTm4w8Nt5gLHlq:22
 a=hDEah0MY560ib8Dcy1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NNChiMEL02J-Q3ZQNuUw_jWHlMPnacJ_

There have been several renamings and modified Make rules since
introduction of this unittest document.

The file list in the Chinese translation had been extended.
For a change to drivers/of/unittest-data/tests-*.dtsi surrounding
translation has to be updated.

Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>
---
 Documentation/devicetree/of_unittest.rst      | 20 +++++++++---------
 .../zh_CN/devicetree/of_unittest.rst          | 21 +++++++++++--------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/of_unittest.rst b/Documentation/devicetree/of_unittest.rst
index 8b557acd29d1..6ed6e3291964 100644
--- a/Documentation/devicetree/of_unittest.rst
+++ b/Documentation/devicetree/of_unittest.rst
@@ -48,30 +48,30 @@ from 'scripts/dtc/of_unittest_expect --help'.
 3. Test-data
 ============
 
-The Device Tree Source file (drivers/of/unittest-data/testcases.dts) contains
+The Device Tree Source file (drivers/of/unittest-data/testcases.dtso) contains
 the test data required for executing the unit tests automated in
 drivers/of/unittest.c. See the content of the folder::
 
     drivers/of/unittest-data/tests-*.dtsi
 
-for the Device Tree Source Include files (.dtsi) included in testcases.dts.
+for the Device Tree Source Include files (.dtsi) included in testcases.dtso.
 
 When the kernel is built with CONFIG_OF_UNITTEST enabled, then the following make
 rule::
 
-    $(obj)/%.dtb: $(src)/%.dts FORCE
-	    $(call if_changed_dep, dtc)
+    $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
+	    $(call if_changed_dep,dtc)
 
-is used to compile the DT source file (testcases.dts) into a binary blob
-(testcases.dtb), also referred as flattened DT.
+is used to compile the DT source file (testcases.dtso) into a binary blob
+(testcases.dtbo), also referred as flattened DT.
 
 After that, using the following rule the binary blob above is wrapped as an
-assembly file (testcases.dtb.S)::
+assembly file (testcases.dtbo.S)::
 
-    $(obj)/%.dtb.S: $(obj)/%.dtb
-	    $(call cmd, dt_S_dtb)
+    $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
+	    $(call if_changed,wrap_S_dtb)
 
-The assembly file is compiled into an object file (testcases.dtb.o), and is
+The assembly file is compiled into an object file (testcases.dtbo.o), and is
 linked into the kernel image.
 
 
diff --git a/Documentation/translations/zh_CN/devicetree/of_unittest.rst b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
index 5c1a8e0cfd16..cfd0b751ef27 100644
--- a/Documentation/translations/zh_CN/devicetree/of_unittest.rst
+++ b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
@@ -32,27 +32,30 @@ OF Selftest被设计用来测试提供给设备驱动开发者的接口（includ
 2. 测试数据
 ===========
 
-设备树源文件（drivers/of/unittest-data/testcases.dts）包含执行drivers/of/unittest.c
-中自动化单元测试所需的测试数据。目前，以下设备树源包含文件（.dtsi）被包含在testcases.dt中::
+设备树源文件（drivers/of/unittest-data/testcases.dtso）包含执行drivers/of/unittest.c
+中自动化单元测试所需的测试数据。目前，以下设备树源包含文件（.dtsi）被包含在testcases.dtso中::
 
     drivers/of/unittest-data/tests-interrupts.dtsi
     drivers/of/unittest-data/tests-platform.dtsi
     drivers/of/unittest-data/tests-phandle.dtsi
     drivers/of/unittest-data/tests-match.dtsi
+    drivers/of/unittest-data/tests-address.dtsi
+    drivers/of/unittest-data/tests-overlay.dtsi
+    drivers/of/unittest-data/tests-lifecycle.dtsi
 
 当内核在启用CONFIG_OF_UNITTEST的情况下被构建时，那么下面的make规则::
 
-    $(obj)/%.dtb: $(src)/%.dts FORCE
-	    $(call if_changed_dep, dtc)
+    $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
+	    $(call if_changed_dep,dtc)
 
-用于将DT源文件（testcases.dts）编译成二进制blob（testcases.dtb），也被称为扁平化的DT。
+用于将DT源文件（testcases.dtso）编译成二进制blob（testcases.dtbo），也被称为扁平化的DT。
 
-之后，使用以下规则将上述二进制blob包装成一个汇编文件（testcases.dtb.S）::
+之后，使用以下规则将上述二进制blob包装成一个汇编文件（testcases.dtbo.S）::
 
-    $(obj)/%.dtb.S: $(obj)/%.dtb
-	    $(call cmd, dt_S_dtb)
+    $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
+	    $(call if_changed,wrap_S_dtb)
 
-汇编文件被编译成一个对象文件（testcases.dtb.o），并被链接到内核镜像中。
+汇编文件被编译成一个对象文件（testcases.dtbo.o），并被链接到内核镜像中。
 
 
 2.1. 添加测试数据
-- 
2.43.0

