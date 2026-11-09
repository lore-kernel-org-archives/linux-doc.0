Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228496;
	b=DxkadG98LXj+uvG3DXveEV5xVSBt5a8hbMNFtlIXCE+WyO0yES4vFEVbrU6yIdK2Y5HN
	 RFab2/H93T1QV7KnaoL5QTpZGCn+5rVCaHIrgRGoMEYRHthznuhVPvAPaCMKyXIWLmAK8
	 /P9e691Iy5maJ35C2ocAn8zcIS0yc7wsedgLqeWrOQOldG1yZURUjHatjtkf6af8bEDFr
	 jC1OnBwxzrnavOH3Z7EwM/0u3ABaIq5Loy2GRvnkyJmO651JcuBaQxBMLyHciDkAAaUmK
	 fxTVPepUjK31z2pTH6EIF0yD7/KI/abPOQ2tjomYoF5PKgttR10wCduUhkpGPxK2PCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
	b=m5DwiXRFSssM1duXlaRz1P+np19vN9Mw5TDntJMqOpUVsv1zcJVtmYkUPCBDDOH6Arqw
	 HkIbqq01nYBdGqtV8xYE6f02C7f7LMMDJSXUuh8SfMhR5Z9d3tEz2y5/GvTKpuX9ADNyY
	 W/q/UeZpQ4NJ5GlPpx/T4UFs2J73e3pZcLi/EkE/ZuYlPSruPAJTvlFYLrLJS7+dQt89b
	 VZe7yhY45qoCPHcBc+CfjQo/oh5fx0KfW7x86veDeafDipmxWyGgB+6ylD0+MgLZIMewr
	 jsrZL6Q4drTL3wT5awcwJWfeaZ0zMwmtrteUSZXEf3n1zPnqsRv682wuUtAYY2yPqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350246082BC8
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 12:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350246082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5A9561979
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=; b=Rz1cNzNq172Tkyx5
	gITH2LVZb1HIq8a89fhb7tq14z3Nn5M/IYXPCpuCCQAMulaDcXbKlTyVvp//Vl2U
	JJoR+aL7RfEIZZ+NkewMCWT7AgaCm/5qEFndmkyn/5nqMMrZqnyjRcjW10IfXo0y
	AtyJnHJnm1BcH9RKhZwLQpnI92amlxy+ArwfviWTtS5UfC65xQjF1rJSEXyk4rR3
	XsKxQM+6Okzdzuu+Eckc5ezElKnF+hYuPLPjg4JUPElSREEvk9p+GJ6icJt40Spu
	hra/rRJtR+mIAoHxfmf+7MqaOro6VgIPzZFXEfXgqzuOZyL+t1rD6jARU2N6lsLS
	FiFFbA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxedmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 12:48:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b346e49674so12911987b3.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228494; x=1794833294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=BIw6kd0StHfoLi7OEAyBRrBkoqNL8ilZVvFwullkQLla3LaVMXUooCOqfE9bi+ySBz
         TpiA7IxG8z+A6eJ14J6/xcOv4y+mNI40lHqKV+vyqq9i16997Yv8dkcjmnbFkOONNjdo
         CeQmZVTWkvC79hRhwNkdRtu3UncHlp7PWi7wWNdyL1n5ye1lpgWY5zwM4MsxggNEtqlY
         A+opcUR7fYu5knU7yQZPlzZbfiBXdPJnu46Nlm+NMZNHZO8vgxYPid4X2CkQbq2FIy6a
         EE5+QneoD3Uw3yIHOdH1NlxvMRy/6QV8mrMcx7VCfkhXFH8hLwj68MixHmzrvdN5a1/I
         FTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228494; x=1794833294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=HSPieN/ZxQWgHuEK9SAYox3Q7+moQ1cAHk7lERkvnn4hOalAFRTDj64pS8WmyEm769
         lNOPCcNlPlmDI5lwIBLN72g/69j4otao2R7CGPy67Z9M6tIIees+m42Zhj5QYP4GQ2zB
         HfUlQNifMwziKZMMBB8qfsauDYpxRoPnGLtJSUG/DL1cjk2If1vPdIjLaRdlsI4zf/DT
         Cgvujt6rkeAZaR4PKCxNhre0c1GBhtO8BNQUtw0w739OvMwM5R5Tgl+hn4nEn2YD2ZvB
         3e6QsoNJLhozAaJAn34dOFlzoDcS4LRVCurDZDMtXUdXgRq1zt9KL3psnvVkv5pWwCgh
         eQ6Q==
X-Gm-Message-State: APuU4Z8n+OfRSZT//kUhpDNYF5Uf3juDPW3pcOAV2p5DmWszOOBXVaFr
	pdR+AskPd/wNrjLSbRwsWY6+89xdbK5v5tMv/XISwdhtKug+PGlSRaJXS+Dbxz66HUXTsWRo97O
	sWctB8B6S7cQHgAzmNszbhN94IOcK9/jeIE5sa1XCuPskj3T7cSpqTuimbGKqlAihiSAlnfuN6g
	==
X-Gm-Gg: AYBFou3qhPXFduewY1msHQ+sW5dtncPbJtigsXUfznRBBAZbl+YH7MmP4Wm1WAnm385
	rboUOQrOf298GT0Jzyehp9nY2//Q8xiP2Uus3U8qxLPS+mMHCOyTSzfre9fyTn3uRljGvPOJ8hS
	Hv0ma58WF4IVjhMFR5BRYXQrWgTLQnRgnsttJeIHftT7azwX9Fy3tAvF3ak2rHaBVsTLp99Owej
	NRGs/kazHKPXUlh4HqioAGqwHlPWT+P9yqcVge+Sro+j4/vzZ864BLJXqwYi+ECJa/LdOyi5Yl9
	9A94oVuc9DIlp7XGxVJRS4quYsmHWj+diIJAyRqa3ptGzgBSqeYNjAAO32oIaRUt5tYgGGw5On/
	0BztBs1pHSaHcDvegDUl2Up7/DwM3Mma4iME+w8Jha6GCWvVEaYL2gpAIETgthOwcDxV8QC4GPI
	8i1wGf5rnRJw==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253687b3.17.1794228494346;
        Mon, 09 Nov 2026 04:48:14 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253337b3.17.1794228493700;
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63209asm34191627b3.6.2026.11.09.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:37 -0500
Subject: [PATCH v9 4/4] riscv: hwprobe: Document that keys describe the
 user-mode environment
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-4-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=E7QUgZlB4TXvJCfVy01ud6KHHfflRvYJVHUOIS1HhZw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB95MCqjkXT7f1F5As0JPn+nSzu0TmMq7j8RtO+uZ4
 CcrNl2so5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACbi+52R4Vfh+qMzOLlZZlT4
 BW973ZOjesY7RvPg8S92e1a85Xkm9pmRYdXek9p1TFoP3qx6wiRsW3Bu5ovZauunM1WICZpue54
 ZwQgA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: nZWzysNbPdiVExh-PElQfSPVTVjJxJBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX1/Ap0yF5lFYB
 2KUM+OSSVq6LHGobRf9Bn1ehiNZRCPDceJsEu5Macjs0MNFr9evrjPjNQMl/jmTRGoeCwvpkFdb
 D7ulZrIFuuWO6HZjHh7alaEdjC7XFzj9QgprZSiow6YsmAKQ1qEQSyM1aN5r082lDKHzLeLthSZ
 S59cP6e7JK4ZIK/vgAIeqMQav5ecufcyihg7ZceWYVNTz1aJb9I0f5Vr0U6vrVMNzqdBiMZu1W1
 CfJ1l2PBh+GDjXohLpENgvbnzKdvHvp/AS6gfCfJzjzrYmWAguH7IpFgsWEwA/l3I1V57NowL7L
 Yhvws61GW6sos7xHg6CSp8nRdBUQ6LvI2P/4wfShs90+xESV3sqrPTVvpl1hI6Yh1JyxTuPRw7o
 cDwEC95kZN3TTl8oZYdUIOVGOE21AuA4AFuga3BhstU7VpvL9ut+n7AyLYev99kxdiEMzn+YShS
 sPk2EoxNsxGmhWT2SPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX2GclIKab+BoI
 1vrX6sgng6zBrbDLiSOn+d8Wtn/Ee81yvq9BKI+sPYDXV11kB8LESBmYRxZX3VI78XSZVnHZS9K
 f5GO6qOTTwDyC0pbHzMxhuMIwVE51/U=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c10f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: nZWzysNbPdiVExh-PElQfSPVTVjJxJBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

Every extension key in hwprobe.rst says the extension "is supported",
which leaves open whether hwprobe answers "does the hardware implement
it" or "can user mode use it".  The two differ for extensions that need
a higher-privilege enable, such as F, D, V, Zicbom, Zicboz and Supm.

sys_hwprobe.c already gives the second answer for IMA_FD and IMA_V, and
the "do not report disabled extensions" fixes [1] bring the remaining
keys to the same reading.  The base behavior keys inherit it, as
discussed with Radim on v8 [2]: a base behavior is only usable when
every extension in its set is.

State the rule once, in a note before the key list, instead of
rewording every per-key "is supported".

Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [1]
Link: https://lore.kernel.org/linux-riscv/DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com/ [2]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c4..30dbbbc27477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -45,6 +45,27 @@ On success 0 is returned, on failure a negative error code is returned.
 
 The following keys are defined:
 
+.. note::
+   The base behavior and extension keys,
+   :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1` and the
+   ``RISCV_HWPROBE_KEY_VENDOR_EXT_*`` keys, describe the execution
+   environment the kernel provides to user mode, not the hardware as
+   such.  An extension bit is set only when user-mode code can use the
+   extension on the selected CPUs: it is implemented, and the kernel
+   either has set any higher-privilege enable it controls (for example
+   in ``sstatus`` or ``senvcfg``) or leaves that choice to the user, as
+   with Zicfilp and Zicfiss.  An extension the hardware implements but
+   the kernel does not make available to user mode, whether because of
+   the kernel configuration, a boot parameter, or because not every
+   hart implements it, is not reported.  Conversely, an extension user
+   mode has turned off for itself is still reported: the keys describe
+   what is available to user mode, not the current state of the calling
+   task.  A base behavior bit is set only when every mandatory
+   extension of that base is usable in this sense.  "Supported" in the
+   descriptions of these keys is to be read accordingly.
+
 * :c:macro:`RISCV_HWPROBE_KEY_MVENDORID`: Contains the value of ``mvendorid``,
   as defined by the RISC-V privileged architecture specification.
 

-- 
2.43.0

