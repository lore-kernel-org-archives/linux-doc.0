Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D539B94A
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350510; cv=none; b=kzEFc+61r9rhNo8JWxhay4U4EDTx7MMsY4iPMfHhtih7iqRKk3GnMC98v/RsgFnKr2hGRCozJ0Bk5nInV2jcuZmcbjYsH98s/lQb1Fi4uB9SY4cdhp48cHbfudmPknDjhr4eHhSK0ceM7v6q35nLDNbBomT1/ABpdUJPxaNJgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350510; c=relaxed/simple;
	bh=k0qJKUK0yLDMGHFI4SeDa0aHR4jbgRpx3R1iMoo2QaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XASbKpGlqS4PQWHhb3dxq8wWgkvcH4/iJ9NGmUfRNOFZpBSJ74stzfKrVxMJMP0Ri+py9PkMBt/ByjHEocyjfcuYUAcpZwR7zt8DXjGHnbAwiffT4D5DQbE7+MWz+49P6MmAOiyRi+q/0fbqC/NA7YGllHWwZHrTWujG8Vw7ICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lasDzM37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bal6dS5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lasDzM37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bal6dS5o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCWZgA2651713
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ny3K+013jV+saMBqOUJ+tjFzlpt2bG83gNH
	rcUmYa/I=; b=lasDzM37O/E+8PCizTO83W4H95668WXEoyJozGemzbN4xec937L
	1yZkjO8tgX9sdE6jgPfgsTQS8X39XOlKOVB7b518PxFknMNR1EoLdGE78nx5VALG
	voLqUSXAvArtfZ1TiSNLc1KH2RzDJCzAgl8XYjO6wkllJUoJ6TCFgeEac0hPHuuH
	Jaf73gV3/suaiE67i6N6o+O70Qbl0XL76ZqlM2t45U4ONYXBaadeUHuEEMonflln
	0A15i2xAGq/aHihzw/ZDpZ92o31YpHD31izPFVmb1wkIcZopcBRJUubEH4HVibOE
	u1gw0aZENXibBuRxGDcJSTAnRDCn+wsmmiQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuhr99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:41:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60fdbcd749fso8146353137.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776350507; x=1776955307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ny3K+013jV+saMBqOUJ+tjFzlpt2bG83gNHrcUmYa/I=;
        b=bal6dS5ogA0n9Rt3b9j7KLGz09txU8ZFednFLaoAMf3QHKlZ1ozAAFKe2jvnSjAsF4
         7oix9H3FmTHt8e2YCZ59oym/eRcRAQXe3PM0sHUL/7Uq/QD2TDXJG2qKPFtbkMvBrRm8
         DZVzqw3lifcel/rOToT312in+hA3tERUSao/u87/jYo7qgnb7e0aiH2GdS14Jx95lvl3
         QPSBYATlhG/i22QPYSBGLXT45E3xAMdvWxxbEG8I+6ancDii/CbbF9cj3eDsn+jsv+ZM
         0bo/nyXbYYt8Y5OYQK/xRjFNESzvldlPWMam1AMzlo6nlei11Om3dxiOgUwmFhfy+n1/
         96WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350507; x=1776955307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny3K+013jV+saMBqOUJ+tjFzlpt2bG83gNHrcUmYa/I=;
        b=WCTtlM6xNVAC6/g1Dbg0LOxCp0NxfgHtyexv0vWaiBdCrPlWPZOJ4xXw/4887VGjiv
         V0usV6dAWVP16RdNFxYmM1jjDXThWhI3CTjJUspaoNDeiU+B9WaVmOFu312E9+eX7xsH
         EC75ZLcI1KAlgO9iTrt2w/SJaqAKzrooXf5W8FIRVCN0hzW+pwvd1PRFY6GXS7pbgDSO
         m8jCbW8KOItOu4d/m7q2ZDwDET8knAZ+YRZt/e+o/IaMUyIY9IOzgjuWcaOQ/iZ09uZ5
         s8sY9XCXoFGwIeqmR0d8POxjuzbBhZZtyt/KITHbR/ngxJfAAc52ZX/bRUdn8TnWMJSZ
         hvVg==
X-Forwarded-Encrypted: i=1; AFNElJ9esNPbQjY5aipDA0FX8a+l9YBIk1KmvUlhqOVLFARlExSoieD+pIVFxokKQWS2uNpJFWqqfcshjVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQpxsEItXhDjvT/10YSKQoJl9INSol3Bomx0c/ga1KzMf2ev5f
	OtuDX3G7D2aW9qbiwkEi98g87uXeGb9ulKB54apsl/Ws082jBnNaT+voXZpBJWukM1F0RHMqbee
	vK8pibweEKHz4o4aHcA97opVhHvNz7C2mlnfu+3lv7g7NyNHZjEfwX6AGT952BPA=
X-Gm-Gg: AeBDiesSdL93r0Lc+48yNBAxL2eWqvd8oyXX0WbWrvsxvbx7rIRfX1KEiZ/Dq2fbsyE
	Ad9hVSQI/4VlZajS1Pm0HksZ33K022vNckyNKFQD7D2BCpBSHzYnfH3glsOgxsjeDkRjEC9nqbx
	FfmmT4QhYEUnkP1m7jyF2N6B89JXB0MWTLjj+THSGRrpAmsqz4aFwpYsQKHCANONQhlfhdQnGXk
	F+1i5OSMhMnz9uQ2uWzqKR1H2eg7ouUcE7VgzqZoUgz/4DNQxfszqkwQJIuL+GGb2pbWYgo9U5u
	oYl0XaE6W/8CK894yN8yCmBfJzNfquudKfmuU6OgRpKYoeb8AZUNYWjoV+XEVQre83OHMGhvT7z
	NiGeqTMwd3fh2KuME43nUl8mX8tuZeUxL9rVR8s/kXC7WBiPDPsrb5QmMMSpBIxqjU7QgpT0LkI
	CdjMmVCnOox186+ZCH9WLZiZgN4e2W7tcDqb3hEkg/bMwKcJg=
X-Received: by 2002:a05:6102:c0b:b0:611:7c7b:4d42 with SMTP id ada2fe7eead31-6117c7b527fmr6349647137.4.1776350507131;
        Thu, 16 Apr 2026 07:41:47 -0700 (PDT)
X-Received: by 2002:a05:6102:c0b:b0:611:7c7b:4d42 with SMTP id ada2fe7eead31-6117c7b527fmr6349616137.4.1776350506553;
        Thu, 16 Apr 2026 07:41:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba299f51c01sm90386666b.4.2026.04.16.07.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:41:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] Documentation: update deferred_probe_timeout cmdline parameter documentation
Date: Thu, 16 Apr 2026 16:41:44 +0200
Message-ID: <20260416144144.54547-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZRzoeNCkKjT9cC-e7gw0YruKl0u5SMM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0MSBTYWx0ZWRfX4CDB58DWr9P0
 7IA+zr7JLtVCLe2oYNiJ/eZyzkqqr5P8S1EwHjxFeEWiWjZgat1DBbeJk1zuOD1YpWJAd1dk9fv
 lqwp+zwqYzXyRix/ZYv3S0V0GgazKq4p3SDwQGdPsuUfIT0njXZ1N2mU+cb5rw5tT1MaczU7q8r
 6CkE87FhBC5XquBfVhkgo1odFjV6Kokre+/wQf0yoXqXNLTBM4YJgi5uH5/lxDZyJE4hQqIALRa
 ozrv4XAcS8vyYOqq50GS2fRDnC7v+XLhPNmTLtsqOqzFJ45F+YXd43TNejKHKK6OJqCF3Bpo059
 0mgCwWNh/JSlq4owlKxAf5BW1f1olvrPd6bmH8An0BzSzqqWIEafy1ATH2l1HacmOxN/rNsTsk5
 4VBuRUVp5ICaQZ93lKTtS/yMpc1UabExAXKDFSFynuSO+liBW4G/FnodpkTS3Tcp6mKQ0JPXU72
 t6AhMSOLKMsxu2RkZsA==
X-Proofpoint-GUID: ZRzoeNCkKjT9cC-e7gw0YruKl0u5SMM1
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0f52c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h9m8XO48Xr72veapeDIA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160141

Extend the deferred_probe_timeout cmdline parameter documentation,
documenting that negative values are treated as an infinite timeout value.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 03a550630644..0f1a1332480f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1249,8 +1249,9 @@ Kernel parameters
 			deferred probe to give up waiting on dependencies to
 			probe. Only specific dependencies (subsystems or
 			drivers) that have opted in will be ignored. A timeout
-			of 0 will timeout at the end of initcalls. If the time
-			out hasn't expired, it'll be restarted by each
+			of 0 will timeout at the end of initcalls; a negative
+			value is treated as an infinite timeout value. If the
+			timeout hasn't expired, it'll be restarted by each
 			successful driver registration. This option will also
 			dump out devices still on the deferred probe list after
 			retrying.
-- 
2.53.0

