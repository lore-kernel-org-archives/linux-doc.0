Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5637CD2A
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488735; cv=none; b=KjNUkk0rYqm7x9FImHNQevF6H6rXaAA8vMimyIDBly/6ageHfNYZbCDNUoeETPzsept8oUTVsrGhLegFi/h8Er+QojMI4SEs74SgNSyQRidBu/Dp67LbjUAha/F55sI6RzZL4N2TKzY5607Yabm4P7fz4Cri3w1gQgvw2VPqUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488735; c=relaxed/simple;
	bh=HBaTfEP8damwWWnMzQH/YpuAPB3B7/0j3KtNT81MfVA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QHWMxOcGoh2YBHtgeN98HNbMS9aPlIcXACgpBS7SAXF1KfKGxq/+I0S/H1XObUG3iuVnEMEIrx+RNEQkzPIf7N22Q11Q2k/T3qbDKFAZnSoK0Hh65JFafkkQDQsUBXu0v7qYVz+3IlZoPUpZ7TH/Y5CQLK0M/Ss1GkbfUJBOy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cut39ALd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KD9IqIdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cut39ALd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KD9IqIdw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842USn1638163
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=czYreYtUDL+AdDzbHXCs5w
	N19gIieyN8OCDp8PV2k9U=; b=Cut39ALdm6I1OC8vWl96nLZcN6XhsMvALPLFtS
	KdwjiSWy6rdGIdnj3OZ/En+ZCFYbw9cdGcvnDuzLFyRleVRN0I+fVGxiXLkEBZ43
	Xe2NIEoBX/PLxxgJccrS9bCeCiM5nIX2I2kyNggwGjlvBPOrvqdTfxUDvMrpapU1
	mc6uwBeKHD2IKphaijz0v29kbZZgmDgw7r+QbfR2/yGfZyJs4PWN/UZ6tECHAyyC
	jFySUfRaBZeljxs0dBd2aZe8LVWeo1FyXj9JMRTnfnCtoRTqN3kPkmC6eEXsPPOr
	Myhf8pCg5f2G5krZ2kHehINuSDtiUa4VGZ/kZ8rDdPW5c49w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8xb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:32:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845df469a26so899957b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488731; x=1784093531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=czYreYtUDL+AdDzbHXCs5wN19gIieyN8OCDp8PV2k9U=;
        b=KD9IqIdw3+QalonusD3PawgcMBji05SznpjtU4ihvBK3YKpI1+2+phuTpw0wxsSIxA
         KP8Iv3TN4OB4KRG0so/FUO4oqHs0/6YTbND73TePWCpDCaYFj6MKgj5oXaptdOZrT9C3
         GL6Akpr/eMzH2/l/Opmp3E6sFY1qF2tnhPkniBfg77Fgo35aOcOfIWDIdAfymo8Ghdgd
         jNMQzsOgMxE4NLJgOs/xx+11LVcaCSH2SsRySoQf6Uhvpby600tPip6DKuGZhS3wVnB+
         zbbQ79N2TPinZEdQj6IJ3+fb9VWr0lKVWMAwIuOba+3W0iaw44XWpwDA65sFLL/QQZhp
         bmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488731; x=1784093531;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=czYreYtUDL+AdDzbHXCs5wN19gIieyN8OCDp8PV2k9U=;
        b=ZAbg9zpRQrAUWJ9XwIA+egyxaWrEAUiC30mIchxwFON5jQSytzgwbs6lYVorcGFkyx
         V49JhMgWK/Rcw7+ECqC2KFPoh3gxQPJwdvmGp7xGNxnoyVKFwGdnVOK8/oJXQM/IAnaZ
         b31T9aXZHRssfp6rxYW9Yck7dgMZ3H3w7Aa7niKyq9mGk1NtT52f2yBisRQaEBCk6XUM
         Rc4TUzM+8MRiWeuwgQ2afXW2f5UwXEBBh6oInFP4uiPKeOcjXmURgyyPffi5eAHmYMAN
         bfkDeY+IryyoTq4LDOt4ebst0etiZkqGwdfQFUVmDlq7jSVZUcHg5gfjBbsqanatDzcY
         SZUg==
X-Forwarded-Encrypted: i=1; AHgh+RrFnR7rYeuSyA9HFmmx7wzW6MCT2G5YN7z9XDb2ocfIKCxeCVLI4wo4Y3lr4+bC/KzobFXFdIgxzF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVX97B1YAB1tDML++tRe79braVml3xY1vtQFaiakC36X8ijAv
	ecT5bnp0T+aTYgttEPSEtn/0F2imrYRcpQUrFcIKu5+5abdQocDMw2jeDmDbMSCRUd4XflHu7nP
	yJ03GK0yS8putPw3pVaN7oRMZc8ZATFmB2BWUFZDuJVQX254K97GfwGMBijOvnvE=
X-Gm-Gg: AfdE7cljv7F1jSCeTSN/UYxAX3jprApkxIiRgmZpotBcN+wLBtmp5w6ClNWuzC9xeYZ
	TM9Aeb2uL3jBEV/+ehwl6+J9Mxra1iB6YbXOYr+oE6CHrf71r3DwJD82r8+RwUi9waRlaOIkWZJ
	/Kn+7Djv7yG42EwngHKEnh63Irteq2wiw1ena73y+f1Ezaotz1R8sXjrIoYj91ZANTqr5xw+z2i
	4OavsjbBV2+mKWQCYswp5rJLyXALNseBurBNYc22lf0bp7cl2D44M08ycgtBBSCVZyEQNQNalIN
	uXeGYzCUyPdCVlJ93F3WEMdnWKIvwvDeDiyvdi10DthYOFSPwLJFmck1WX++AvvSpUaPE6O1Jhw
	P+/FaOBbVvy4yeSoL6mUVON8LPu1Cd9C4vMyUJg==
X-Received: by 2002:a05:6a00:35c4:b0:848:2f77:e2d6 with SMTP id d2e1a72fcca58-848438f8ee3mr1051239b3a.63.1783488731018;
        Tue, 07 Jul 2026 22:32:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c4:b0:848:2f77:e2d6 with SMTP id d2e1a72fcca58-848438f8ee3mr1051201b3a.63.1783488730339;
        Tue, 07 Jul 2026 22:32:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:32:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 00/26] Introduce meminspect
Date: Wed, 08 Jul 2026 11:01:39 +0530
Message-Id: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvgTWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3dzU3My84oLU5BLdMmNdc7OUFAtDM7NkkzRDJaCegqLUtMwKsHn
 RsbW1AKGb7OFfAAAA
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=11849;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HBaTfEP8damwWWnMzQH/YpuAPB3B7/0j3KtNT81MfVA=;
 b=/7Bc4SpQMM9aD5ZEDXUU1K2SLYjZnnKa3Vk/3lp46pAbPqaevvkOXjBjX2jHejKnoEi9OjiAP
 gX32aEuqU/EDvmeDvxh+TKTuGcp8RF4OsVMztsVrL/BICpCO73gT3gK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8HdiPlilJfT2
 dF4tQhS5zzLHZPOPZzw5xmj+bAddGEn56vNoiPvrSPI+GM15V8Qtpa3cMykJ6QC2XLkKJRLdnSI
 6JXcrhDhelOu8mZhPLYYsmx5nt4Yzc9fjVEeaP7b/PLoViY53G3viBb+CGlAqqgYlcb0akYxDVE
 FmPnS09eSPZku1SEdrOZoV0YQ1hd14Y1fMB4r7clXBAPoKdO6ankkWyQL8/4ni2WUTBCvCBta8c
 cLixskcfcvQr7PfglWKrfpoRud79LhUgfHYU1xB9nZ2CNhg+SQ6GjWv+jOmJtrI2uCsRE8t2mwi
 aQh5nVAp99GtJkQVMsgZHeTPt4Fye6fPuPvX1JMjxl/lyyvBC2ALFnMTxosUR2YufQdWnnOqOa8
 uzOm2iw2tc5aAFuIZ6TcFcVqZ20T0vs739dOtfSO2ZVdkqn2/d2ex08tl9xcjJa1tmf+/S8kjHY
 diZlQFVcU+7cFHw79sw==
X-Proofpoint-ORIG-GUID: sbwJulgRwwpXeIc-sS2MQ0rlmCvksy67
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX28+aQ7Blw7Gt
 vjY+NFMHgL9nyDyeSw/HB5GyGIwSo0cOUq0wz1GRepXht86wfNaFBnH0Xr1iU3XmpJjzmDKS6Dt
 saSPreri0rK5/PmPI4BvmStvFjdE0Ac=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de0dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=vnREMb7VAAAA:8 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8 a=pHSkyj2oBRdTMXCnRkcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sbwJulgRwwpXeIc-sS2MQ0rlmCvksy67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

First of all, I want to thank Eugene for his excellent work on this
series. What began as the Qualcomm Minidump driver from me has now
evolved into meminspect. He also presented meminspect at Linux
Plumbers 2025.

Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=aDZv4-kOLSc

Introduction: Memory inspection mechanism

meminspect is a mechanism which allows the kernel to mark specific
memory areas for memory dumping or specific inspection, statistics,
usage.  Once regions are marked, meminspect keeps an internal list with
the regions in a dedicated table.  Further, these regions can be
accessed using specific API by any interested driver.  Regions being
marked beforehand, when the system is up and running, there is no need
nor dependency on a panic handler, or a working kernel that can dump the
debug information.  meminspect can be primarily used for debugging. The
approach is feasible to work when pstore, kdump, or another mechanism do
not. Pstore relies on persistent storage, a dedicated RAM area or
flash, which has the disadvantage of having the memory reserved all the
time, or another specific non volatile memory. Some devices cannot keep
the RAM contents on reboot so ramoops does not work. Some devices do not
allow kexec to run another kernel to debug the crashed one.  For such
devices, that have another mechanism to help debugging, like firmware,
meminspect is a viable solution.

meminspect can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb
and analyzed. This happens if CRASH_DUMP=y.  To have this working,
specific information from the kernel is registered, and this is done at
meminspect init time, no need for the meminspect users to do anything.

This version of the meminspect patch series includes two drivers that
make use of it: one is the Qualcomm Minidump, and the other one is the
Debug Kinfo backend for Android devices, reworked from this source here:
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
written originally by Jone Chou <jonechou@google.com>

Tested on Qualcomm SA8775P (Lemans EVK) on next-20260707 with the
minidump backend: kernel crash dump regions correctly captured
via firmware.

This series introduces a new cross-subsystem framework and, to
avoid merge ordering issues, I suggest the entire series be taken
via the mm tree. Subsystem maintainers for touched files have
been CC'd; I request an Acked-by from them if the respective
patches look fine from their side.

Alternatively, the qcom backend patches (22-24) can be deferred
to Bjorn's qcom tree in a follow-on series once the core
meminspect framework lands.

*** How to use meminspect with minidump backend on Qualcomm platform guide ***

Prerequisites:
Crash tool compiled with target=ARM64.

Target kernel must be built with: CONFIG_DEBUG_INFO_REDUCED=n;
this will have vmlinux include all the debugging information
needed for the crash tool and CONFIG_MEMINSPECT,
CONFIG_CRASH_DUMP, and the driver CONFIG_QCOM_MINIDUMP.
Kernel arguments: Kernel firmware must be set to mode 'mini' by kernel
module parameter like this : qcom_scm.download_mode=mini

After the kernel boots and the minidump module is loaded,
everything is ready for a possible crash. Upon triggering a
forced kernel crash, the target board will wait in download mode,
where QDL (https://github.com/linux-msm/qdl) running on the host
connected to the target (here, Lemans EVK) can be used to collect
minidump.elf from the target device onto the host.

Currently, --minimal mode is being used to get dmesg log from
crashed device.

Without --minimal mode, the crash tool needs to be patched to
not crash on missing symbols and needs to be tuned, which I am
currently working on in parallel.

crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x514f0014]
[    0.000000] Linux version 7.0.0-rc3-next-20260309-00028-g528b3c656121 (@21e3bca4168f) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026

*** Debug Kinfo backend driver ***
I need help with the testing of this driver, Anyone who actually wants
to test this, feel free to reply to the patch. we have also written a
simple DT binding for the driver.

Thanks in advance for the review, and apologies if I missed addressing any comment.

-Mukesh

Changes in v3: https://lore.kernel.org/lkml/20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com/
- Addressed most of doc. comments and binding and 0-day kernel
  test robot warning.
- Add timekeeping: Register tk_data into meminspect
- fixed some of the bugs identified during testing.
- Fix missing return before dev_err_probe() in qcom_md_probe(); all
  three error paths (SMEM lookup, table validation, table init) now
  correctly abort probe on failure
- Fix meminspect_traverse() kernel-doc: @priv description corrected
- Fix meminspect.rst: replace stale MEMINSPECT_ITERATOR_CB type name
  with the actual meminspect_iter_cb_t typedef
- Add kernel-doc for meminspect_iter_cb_t typedef
- Lot of code formating and style change as per coding standard.

Changes in v2: https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
 - Fixed doc warnings
 - Fixed kernel-test robot warnings.
 - Took Mike suggestion to remove mark inspect flag for dynamic memory.
 - Added R-b for printk patch.
 - Modified some commit messages for clarity.
 - corrected binding change for debug-kinfo as per Rob suggestion.

Changelog for meminspect v1:
- rename to meminspect
- start on top of v2 actually, with the section and all.
- remove the backend thing, change the API to access the table
- move everything to kernel/
- add dependency to CRASH_DUMP instead of a separate knob
- move the minidump driver to soc/qcom
- integrate the meminspect better into memblock by using a new memblock flag
- minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
remove some useless code, etc.

Changelog for RFC v3:
- V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
- Removed the .section as requested by David Hildenbrand.
- Moved all kmemdump registration(when possible) to vmcoreinfo.
- Because of this, some of the variables that I was registering had to be non-static
so I had to modify this as per David Hildenbrand suggestion.
- Fixed minor things in the Kinfo driver: one field was broken, fixed some
compiler warnings, fixed the copyright and remove some useless includes.
- Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
and it's now available in kernel hacking, as per Randy Dunlap review
- Reworked some of the Documentation as per review from Jon Corbet

Changelog for RFC v2:
- V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
- Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
This means new API, macros, new way to store the regions inside kmemdump
(ditched the IDR, moved to static allocation, have a static default backend, etc)
- Reworked qcom_minidump driver based on review from Bjorn Andersson
- Reworked printk log buffer registration based on review from Petr Mladek.

---
Eugen Hristev (21):
      kernel: Introduce meminspect
      init/version: Annotate static information into meminspect
      mm/percpu: Annotate static information into meminspect
      cpu: Annotate static information into meminspect
      genirq/irqdesc: Annotate static information into meminspect
      timers: Annotate static information into meminspect
      kernel/fork: Annotate static information into meminspect
      mm/page_alloc: Annotate static information into meminspect
      mm/show_mem: Annotate static information into meminspect
      mm/swapfile: Annotate static information into meminspect
      kernel/vmcore_info: Register dynamic information into meminspect
      kernel/configs: Register dynamic information into meminspect
      mm/init-mm: Annotate static information into meminspect
      panic: Annotate static information into meminspect
      kallsyms: Annotate static information into meminspect
      mm/mm_init: Annotate static information into meminspect
      sched/core: Annotate runqueues into meminspect
      remoteproc: qcom: Move minidump data structures into its own header
      soc: qcom: Add minidump backend driver
      soc: qcom: smem: Add minidump platform device
      meminspect: Add debug kinfo compatible driver

Mukesh Ojha (5):
      timekeeping: Register tk_data into meminspect
      mm/numa: Register node data information into meminspect
      mm/sparse: Register information into meminspect
      printk: Register information into meminspect
      dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory

 Documentation/dev-tools/index.rst                  |   1 +
 Documentation/dev-tools/meminspect.rst             | 144 +++++++
 .../reserved-memory/google,debug-kinfo.yaml        |  48 +++
 MAINTAINERS                                        |  16 +
 drivers/of/platform.c                              |   1 +
 drivers/remoteproc/qcom_common.c                   |  55 +--
 drivers/soc/qcom/Kconfig                           |  13 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/minidump.c                        | 271 ++++++++++++
 drivers/soc/qcom/smem.c                            |  10 +
 include/asm-generic/vmlinux.lds.h                  |  13 +
 include/linux/meminspect.h                         | 271 ++++++++++++
 include/linux/soc/qcom/minidump.h                  |  70 +++
 init/Kconfig                                       |   1 +
 init/version-timestamp.c                           |   3 +
 init/version.c                                     |   3 +
 kernel/Makefile                                    |   1 +
 kernel/configs.c                                   |   6 +
 kernel/cpu.c                                       |   5 +
 kernel/fork.c                                      |   3 +
 kernel/irq/irqdesc.c                               |   2 +
 kernel/kallsyms.c                                  |   9 +
 kernel/meminspect/Kconfig                          |  29 ++
 kernel/meminspect/Makefile                         |   4 +
 kernel/meminspect/kinfo.c                          | 257 +++++++++++
 kernel/meminspect/meminspect.c                     | 474 +++++++++++++++++++++
 kernel/panic.c                                     |   4 +
 kernel/printk/printk.c                             |  12 +
 kernel/sched/core.c                                |   2 +
 kernel/time/timekeeping.c                          |   2 +
 kernel/time/timer.c                                |   2 +
 kernel/vmcore_info.c                               |   4 +
 mm/init-mm.c                                       |  12 +
 mm/mm_init.c                                       |   2 +
 mm/numa.c                                          |   2 +
 mm/page_alloc.c                                    |   2 +
 mm/percpu.c                                        |   5 +
 mm/show_mem.c                                      |   2 +
 mm/sparse.c                                        |   3 +
 mm/swapfile.c                                      |   2 +
 40 files changed, 1713 insertions(+), 54 deletions(-)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-meminspect-v3-76dd8166c4f1

Best regards,
-- 
-Mukesh Ojha

