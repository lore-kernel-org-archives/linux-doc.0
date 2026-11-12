Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506531;
	b=J+mZcJFGoOTPLYDmLDAwbMawpfyepM5eKwuiHyRmJvnWSk26nYOAOX+4CiL8nyJx7Y5y
	 PqYYMEpbQzyR6n5+c6pSkgFyyJh/x8Uq6jI27rf7jagWEz+N12A9vn0RYm0ssE3utGARA
	 W+5C4sxv3uDqdFZvluYaOsZRv0dLW3wgBGk/1uZaX0VUYTmGdxxdI8vaaHufZooyW1uRd
	 FR6je2wmRetoZnFiFM4ne/+ohUTDfIPBjdWreLFbt7vqt8lxmOko6vFj3Gq3FFSOwzMnI
	 6C8Y6eLECBfxhKQBmRBMnJMANJAU0i+ioyPp52uOjzWCSsSgr3u6cAnvMXoaQ76JfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
	b=WM8G8xjoXRVsYRSGfrp//PTFRJnkV6f2KeItTRseKZ2bOWbIxG92PDFYPKNuvQK/rbXR
	 Ym1u6Q1fIPjhWEGz1OghfPoCE0bSippcjHHtX2i+UPtzKI7fpelYfnFq4mCEN31O2zfpC
	 duBGEpQSy7PPQbsrLHQJly9E4ePZEt1BcB6gjIFxnre2/zwJ5qbmQUjud0fdhJtHKvSL5
	 rsj0aN20dkumiHAgo8kzugtpOm0Y8qvw4eqEji4/n16FEteyw1kLijZiE4mcj3SMXZtVb
	 r2+yQJ0vL42DBsBWS5TOfGZeaMqUMNmW3VgdHYMoL7y+snJDavqgu62wTfAeq8A0P4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A2/jZtNk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F1606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2/jZtNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZXmS1736622
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=; b=A2/jZtNklLwEH3VF
	MjxWSGKtysNcngnLz9nCc5sc7/gnGbaGuYZ7zGqVOcKlM3AKsHIhmaDNdYQI4ZWi
	az0VQuSJZy2CM9eerFUxN61c5NsUuQzxiT8gItwg263EYYQpvSe2OFTk1hHyIHWv
	zj2A5PMIXu8TmQfB+bV94iuGZi7aE2RXG7j/lEkQz0san5pM0oxql7aDbK002WSr
	q3YACElXm56wWe+/r/V6oMS73GNwJk13I7nFJ22sdQaxoLFya70HPeAgeXEJhP2C
	IZFSFwkvlw+nRnbXeumYkkoleNslYC3xwOyapsv/o/316CYMF4zOohQxHMX4w/kE
	hE54bQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2r19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:02:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso453227eec.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 10:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506529; x=1795111329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=IWIJzLY82eJhjx1LDl4M8p9/EuzkwvdbjMobocgD6rzIEUFY9Jlhrk4mbqisvSR+wa
         i7kH9LefCVY8pMurhzyEs1l/69Jr/TsmFZNIPhXQtUPfWyUOKAIVszNpiYuMgWy0UNd2
         8F5Gw7EUhEwypI5N2ByJFGSZu9sAhLoIc1TAIymdH3mzzPADwFALm1txD5H6igR5sopO
         UGXmX62Vb33o9/Oww3gqrXidBn9azUhzCyExF6CEEF5M0NMNAphUnCBjs5n3MecOFgd0
         Ip7yOElPuVXvhHFn7gfDpP+TpJNQ5fFnzyJDK1Mt3eXkuPUEl55GsGol65FtvMbS05tu
         TWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506529; x=1795111329;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=ET6ocPVVDLV1gr2BNPFHsRNJKb08Y57xpYVYwO8SygzbVL5gdpw87a10ZCJfClK0xt
         uBiMIo7/TkZNLIR1RqXRDiii2m4idULTBq68+K0wRLl1wLIyHgit0Mti3vV7jQCcE1C9
         Vq16ll0pWwz6aR6sJ9/cObwSJXw1g+oqOvAOEFhd5Rrjh5K2c09K9moPzqF36L/KvYCe
         ttBgT5Ncxtd5yz9FPj33hKMfVWbVLhSSMuU9Lw+HhABXYdNzzeBroj8PjXGVzDHlY7m9
         j4YOeaMsOUZ1sMClfHZTONrNSSWd58ckThaByWR+29Pf8QqxDjeQBn4PeAOnMQ7Z8FvY
         qGKw==
X-Forwarded-Encrypted: i=1; AL+hErGKzohAO8T8IHwYGt3KQ4jooIT/zGC3ESoh5+Z90d1HTS/52iIvOX9cHAtfFNXQlet2bBDiBdTP0ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vIub/ao5RwFQMSFKKC4TMn3yVknpo0b97e+QgLHq12js1AmxC
	73XsL5ZJl/1u/8/J4mhr7snfG1mzPSMgtb3qHrbL5TOGrdep6Gpjf/MXEXm20AgP3w7YNOOwgwb
	q+P6KvJAL3na/y5CJk8qtBZkmpJoZMl4DCLL3kdFyVX+lV+8/nqR/8TJAPs9/Xmo=
X-Gm-Gg: AYBFou0mbMJzduuSvwuPMuxwZlL2k7tryRXZkohLKiO7Q+dh3FezIJ8Zteun+a+oGcv
	iq08oa0WR5qydQsUlDhO9w92VF7fx50xAF4BT430m87hXJsaWI9qLiyN3AdOJhZGtrDv320SMWb
	A07dlv6DVCHlu+slYE3gt5l8LwKl01ycIm76M7xZiseiXooGCmKEz+eALE5rw29MGUk18LrSW5M
	o1OLlHpkMO//q7hY5koEFFot6ctOy0vNF9sQ2dUkKY4BxZMCdfEUBsp7aJJ9gMmQpYA55Lk8Cse
	tDAjmP3R0LxLr7U51AEpN2d+3EEQk/KOAHgWSgJd9z9rEHOpolGniEedfVOpGqSBAPdtEiq0edX
	u2Wqle/q6RX/f6/T+p+RIRj5E+CNIxHU9falsBAjrqNwO3+SRITgF1kZc74GNJlftyMIHUejEjE
	50g88sMVyPy4BsF03i6JJ2glYPvA8=
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6022200eec.38.1794506528788;
        Thu, 12 Nov 2026 10:02:08 -0800 (PST)
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6021582eec.38.1794506510251;
        Thu, 12 Nov 2026 10:01:50 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm510064eec.8.2026.11.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:01:49 -0800 (PST)
Date: Thu, 12 Nov 2026 10:01:45 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261112100145.00000560@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-11-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M55hJSKOpTF-N_WeefNinKDMY09HvLTl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX5jgxeN3del+h
 zpVFtQ2JHIa9djqQ4ruwmp9Ue+7FOMX+no3/pf3Sp1UZg6bhsmE+eDb2YaxfMRj3Ekms8NlqP7o
 8EKDNmIbWNZAOLvZla/Y2Rm2njCHi4I=
X-Proofpoint-GUID: M55hJSKOpTF-N_WeefNinKDMY09HvLTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX2Ix1AipWL8HQ
 rfc6h5gI9ouFgDW47j8WMiTcQesUcyq/Yzoj/Hgxsj9QWz+bBjHjgxrDcrFoFO3Udeqzs/9QZc/
 6ujyvlav/tl5mgcgoXMZ3BtjcAqtXVKBw8kLHvVt67jzLFsot/tLSzt6Ywv7hxMP+vNUv22IKF6
 4mPj4exyfil4xtOFxPBZon4LDLuriOhn2lCK/N95p8vibhiw1N1XREZHp4ZVtNJfbeDs5dHus0u
 U88meEmNXZq9NoFNYiRXiavL07fpsFWhp3cFjCmr1OmfWpEpkhEDAlyOCLPLriKOUW7u1aRIKIr
 Zo3oeYiuJ4qaGTxUgguJ7+DAZW+JjhPSxOSqhrbX2zRoI/8HvvOAqeB9TSqOsHbji9FWZaKXnu9
 sZtPrxB1Z/FKZhDEeYVSEeFPIka4Ex2p4UA9Nhf7buSUciel4KXQWROuCZgZOHrUUdHt6qu55oP
 7sgj2hk8gYpPruD7U9w==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5ff21 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=eWwvBSKlxOWLqK439NMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120071

On Mon,  9 Nov 2026 09:11:56 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add basic Telemetry allocation and initialization routines, introducing and
> wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> optionally using a lazy on-demand scheme: this approach factors in the
> flexibility needed to minimize the amount of initialization work based on
> the effective access pattern used by the upper layer ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

This stretches across the patch set but first elements related to it are
in this patch.  How do we handle larger values of de_data_sz?

The spec allows (and it's useful for things like histograms)
DEs to have an integer multiple of 64 bits for a single element.
In the shared memory buffer that just ends up with a bunch of matching
IDs with discovery via the parsing done in this patch.

The only (I think) today to dump that from this patch set is
to use the shmti dump interface.  That's not exactly nice!

I messed around with (well chatted with an LLM about) a couple of
options.

1. Make the whole stack aware of multi line DEs. So all the requests
   get to return more data.
2. Adding indexing so you can get a multi line DE in multiple calls.
   That makes the interface for a bulk read a bit odd.  Userspace will
   have to be cleverer given variable sized elements.

Given this is a ABI related aspect, needs figuring out sooner rather
than later I think.

Which way do you think makes more sense?  Or am I missing something?

Jonathan



