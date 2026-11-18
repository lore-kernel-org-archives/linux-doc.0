Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025815;
	b=a85kwJjlYITd51m/tJKRa7mn7Ot1nBSus3KP/kZtiFJ+FuTOV1jQ/Egrcf7h4JINizDX
	 YdeaxU30ZbCQENZJUXMzSD58GH/N9DgsGFWpkvOz/ekInDmvmujoBJNrqQwpVj8lrgQuM
	 wV9Ir+Qdd+31UzC3QAwGbVmvwPD/l4GRc88aYHu0unquf1v4gym9fhWRbuWiFFBD/oiJm
	 uoXNcsQplvB1n4amJ1jyly/jnpkFodmD4Nq/2tF00WX/X85WWLtl/NSfI9RnEYZ2U5KNI
	 sG+0YnyOMKnpRG0Yv4jlrzoBKz9/3NAmkmI1Xzqp32ZK5nlROLuknJpI7fB7WS8XcuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025815;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=oIC6kv5yh5CuRJ9yTdasGGmabz54ICUD4XSBDnqAAAI=;
	b=23GDmEgn8K0SxI9RxaCpocbtn5h5Vu/PqVyyE7yGS5OBFP1q7DGpKIC6MJIbC/AYuZWG
	 QCRAG+zvgDiUQKWf1uo/pgCDLW+fXHTDMZsUc3xwXmQYhukwikxsqyNdvCpuqp6AUibhF
	 JGXNJRSrY8s5BCHDeFPhgbdJWtM579GY7urgCuCJCQ3B8G9bmTaS8Iekt9jHSUznypGjl
	 s11JuWt2kL9SPLIEYUktYrEfw8kYc/l37hPBuub9f+1yHq/AA/Op4dViNQB9VDZnbwEms
	 cWs7q7AbBUKKakBbPxqhjgcvpEe3rO5+Fx+5bgfijwioXrwbh2PG75UM9RqhgO5iN3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KdODWI5v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CD606A330;
	Wed, 18 Nov 2026 18:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KdODWI5v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNzd7VbGqXX9emlh+Qx0pzup3uOFNAUoqvx/l49tlj6xIpjLh+cBeW5/MU2K6s5L+RLU/BiiV2iab6e+wZY027ktT3WNUCPM8NQjXyQvi3mUxSQyDG6yDKbCIiuiyBtkimYyXPd/2RqZZCaidxZdGAeQMj33jFL/43JO25ENMhSXHfqjX/3CWS0lvYMTGOH7wKnQHmab6+M+El2ddmgoo6vzU0v8w/BQuuun7wkPi03Dnmoqy52iNCbAUZ7/DUTyoNP6zcEtJGKHvDO42vzcbpJ4OYAtBvA5LKE0Jwr50T23ofzr7u59DIanVgdN6KBcBVgbGK8dkaV8cXWWbyTrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIC6kv5yh5CuRJ9yTdasGGmabz54ICUD4XSBDnqAAAI=;
 b=zIuh1AI2vZ+ddCTG/1gbMA2oQyoqTMWW4GBzuBtgbZJRNJipm42YzMuWNeMsdZg4MdryxkbeOo8kjCJiY79SZ3GRavzDX1CjmgYoLPRk4Qornx9Csg5jZ1tLDUtcARCVuMNge/Hs+xeLmAGNX5AZj5M1Dx1Ke2rMmV+6WzQhjDtqZyfsUXCNfOJrLQzP0+gmY2bcpy61qSFaxw983tF23ssoVmE/aXphyvBacy7brtbd2JKLoVQZqH5NF6NCIeh7n5CFrX7s1p7Luw+LmkMdrJi0Epsqo7etMN6sVKRQKbWflq3LHdKfgT7IT+6mM7/fy3MW8XMOjTOUa/UYm82Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIC6kv5yh5CuRJ9yTdasGGmabz54ICUD4XSBDnqAAAI=;
 b=KdODWI5vpj9uW3p/jzpVGvX9GGPH0Bl2K7bQU7ueZpnI/ufKEcfs6qQLyVlZh4Rif0bDzamTwm4o05oQIBSwu5B8s+QChZmD4lR8VQZ5PlymEQ5QujJvemEFpUP5pNFrDgEaM2JT208mkY/iw/UgNm+DhbnF1Kx00gByKalaqoE=
Received: from SJ0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:a03:39f::21)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 18:16:48 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::1e) by SJ0PR03CA0226.outlook.office365.com
 (2603:10b6:a03:39f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 18:16:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 18:16:48 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 12:16:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Wed, 18 Nov 2026 12:16:40 -0600
Subject: [PATCH] Documentation: amd-debugging: update amd-debug-tools URL
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-superm1-amd-debug-tools-url-v1-1-102516e88a0a@amd.com>
X-B4-Tracking: v=1; b=H4sIAIfr/WoC/yXMwQ6CMAwA0F8hPdtkJUyNv2I8wFaxBhhpmTEh/
 DtDj+/yVjBWYYNbtYLyR0zSVECnCsKrnXpGicVQu/pMRFe0PLOOhO0YMXKXe1xSGgyzDugC++b
 C3sfGQRlm5ad8f/v98bfl7s1hOUrYth2oFdr9fwAAAA==
X-Change-ID: 20261118-superm1-amd-debug-tools-url-0ce547e55d40
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 3443f2de-0ae3-4314-8fe8-08df45a01c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|18002099003|6133799003|3023799007|56012099006|11063799006|261022115727099003|261026140227099003|261022113327099003|261028144727099003|261009223027099003|261026130827099003|261022075727099003|261021135927099003|10067099003|261021130227099003|261021133027099003|261102123227099003|261026135527099003|261021121427099003|261021123027099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	A1RKX0cgDCbksjI+b3yeOIqdWg2S31vu9e1A1jBvDW+qlvrs29QWpDng2vmrfO9IcdNpsT/q9qetByJr2vE/HPH+wxehChLXkaFNbRrJ75xVnB9Is3D49RNhGAyf6DcAzkQ55Z49rtzgKAWOgNstHEBXvGyVrCvGz1Ukc6JcSmvpK28Q/76pUpDwrbQfWc/x2l3i1Bzhgh98ljcdk6uWNKkt8+CGXDRZndnan1DvUSthC5AlMh1wkMNTY4xMUEKJq2biBlHCf6U6J8T1QnlnJjbuB3ranUqSliaIlgz0mSrsHxrzOuSZHKb39yKO/2R09iQ5urAhSJTdKSNGap+ScMDoY6olQvmM+uylwf/jCcX4clfjtXtqvQuC7MU+6mZaITsC1YpgZwwj1Y+e5z9tRRk5A+AUHmlvkPKLndrGzH0U58atiiYIS+TEci+nSh+v+iYd19aeCXjkbq1rIz5Hz6DUT9pACZMAmXZCvl4Bfo8TQKSx6z1o61afVOEnXLECheRJNPHHdyY1iEuLQ9D0kFHHPjRlfLH3pAm/P2HfRkLoj4Pgv/GBItu+G6EU4hxzwHK2FsBSqVbGy/6xgauCNQmxQecdX3q8D+2vkmXIhxtZ/GimigkBQJZGWgCEvnsa0/OEuRBVxcXJ6jzKxUyBJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006)(261022115727099003)(261026140227099003)(261022113327099003)(261028144727099003)(261009223027099003)(261026130827099003)(261022075727099003)(261021135927099003)(10067099003)(261021130227099003)(261021133027099003)(261102123227099003)(261026135527099003)(261021121427099003)(261021123027099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hwRqsX9Oy7sw4JVSuLSuAfRA7GtuV124ALxx9r98j0zP9T2j7EzDy9QECcPiRQhbrPKPWUTyAsgfDzqt/uPXKseLMQw3vD3+14Xan03tCe7v/XxwU1MCOzJC4FjSzOH4mAkcRyc5G+8OJ1bNgbEQKJcSBRAtsKFxrIdqZF9DXBdM9G6qJ1Sz9ZEptP3dqCWJBnerASvb/IwBndPefJ0ySGyLsBMNeNiuefE8tuKw0kN8B99o2lPxajrIEBhek+N4l8zMp7QICWvUCwr5npkrJ2T/NRZsHKDZnBpXh0FbQTad3C/g+jG04kmZyyBRnP92EmgmoIrRaD4y8aMAuWEgP+WUdyyPMA6qjZRX2Nl9Qmn4D760TdN9fp13npvKwVS2FhMUcvMKsVjJtgu+as/E3fCCdW4RP2Kc/0xRhM11kOCRL/OFf2VqpYv4Okm2alzb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 18:16:48.2323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3443f2de-0ae3-4314-8fe8-08df45a01c65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710

The amd-debug-tools project has moved development from git.kernel.org
to GitHub so that it can take advantage of forge flows that don't
exist at git.kernel.org.

* pull requests
* CI
* automated PyPi releases

Update the link in the s2idle debugging tool section to point at the new
location.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Documentation/arch/x86/amd-debugging.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 3176a1240feeb..f5f1e02131882 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -42,7 +42,7 @@ s2idle debugging tool
 
 As there are a lot of places that problems can occur, a debugging tool has been
 created at
-`amd-debug-tools <https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/about/>`_
+`amd-debug-tools <https://github.com/rocm/amd-debug-tools>`_
 that can help test for common problems and offer suggestions.
 
 If you have an s2idle issue, it's best to start with this and follow instructions

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261118-superm1-amd-debug-tools-url-0ce547e55d40

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

