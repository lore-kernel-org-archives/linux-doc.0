Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382449;
	b=Yug1c+Pv4MVlzBpUjqbte8d91cvSQ6gih7HRjTXw0vSqGyT3EYQsi0vbKB2zQKS9myy1
	 YzSPq3wdByBUFsEQD6SbnJc6+pt8hfGw20AF7SJ+5hGRb36MdmI/wF64Mj926q1vcG5Ig
	 6NDEV1bn+R9jvJniS1SfYebPNKRaK00WWcNRpiGv5YLCqDZBtIdbzb+HY5OQE/0J4mo06
	 mHnT0LEPNurqRfnp478oxEuGhRk/wW6qLZMTMUMUDGKsomJ0otK3qZfdeJ54rx3/tyVsL
	 TkUmecOb+eenMgKFvpjkfkxsZGbUrkHsUOY5ostFP6e6V36i/aTMKyJ1k0XGlKLaxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
	b=Nt5QIFVB1ZIcfOFZOIsIL/ipsfmWVaY0QxmA9S3Rc3lu3nbo4NZk2QKShre10EEVKbZx
	 /kxYEBWgCtg92cVvXEP7FCr/NbLEXy95+pMsZp9jodVKYYpn1s8G+HKDabZGRmJoa85rc
	 OYE9GoNAYHUnlXq43rsdok2VFSEC5r5/MwYs2855jiZo5NPF3cThdm/k4nJJLTaVQLPn0
	 0Ve6u35WKQnDZmSEN7v8baAG/AD1A0MBZLZjCxcZOViBXSvMPOberkCWM9MuJViEuAQ1G
	 HQ3VhRprHOLXzybHYTtVHOQ8XInKjtejZnmwgsHeeq54+MaZ4fO2tQ8eAXykTJpJX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80184606A31E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 17:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80184606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERFie3515574
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=; b=Q+uOJQx6MN7bb3Qp
	RIQYTGJp2FfIusVoQOW4c63d9kjqf9fxZE5a+4AMLZ03E3UWZKhYtxxNDQxmrv4d
	D7nXu9WxEBKPvZXkAgtmE08o/m638bt1LeKz9gZqzO9Z1F4WrmKB4hhO4d/kw2/Y
	AByqDlV1dclPMk97s/tXSR8QqMgqvUPrMSzmAy/GlYXH9UH+KBCu8JujNQHC6D9i
	evxujPQd6NPk0uS5cLyla83tXlWHbJi4/pywcNTdQg7JBet1vESc646SDTrxon0c
	UGQQYWMKkY8K/GpKNr3A8akHe+CgD7KJtltINTYsYqKDqBvtnA5bqsHO9TjFGM9A
	3+Zc0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qmbur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2158871eec.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793382447; x=1793987247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=WAtypqQggD/Fr0zt6j/gkIyY/NCMrf44hvdYgTKN2FQ0Apb/3yxP83wtyrKdXzBoOl
         Mk29YcqcXlsQ8vsAIv5T7knA8QvP4X6IL5oIr0oySJBgzUhfH9IgdCecjmN9z2CUqUE5
         /8p806PkQ4NtCeog6eD0NidvD4lfk9zplbFs2JkhEL59yUvcSTBkdhqXEsOMTL3VTFGV
         zmSFgrwGr/kLZBsAqvMI2096pUB6hdHXVZwpsYRvRtPokyR1uRAm01dGx+mw84Z8mwuE
         T4qIcMiQry0zqGkH9R6J6n0K/bKQbVjz6NUIjkboelCDF7aLwGN1hyPhrRS9DGSoa9ls
         TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382447; x=1793987247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=gynAYae3FTaFZIsBUK0QKKb5lVbE8svzskmMA9M8GV2XnP3/Mt4fOK/0zZsTMkrFRf
         jVw0YeIAz8UyG4CI93+TRNYdB0reEjwo5SDH0yjawSdly3nLMaR9st/d7ljPpP0qw+w7
         jtGXUYGOCoSotgJwe2RzplYwt3TKbnw+EpdhcAZ2LTsXrkga869c+aZeBvkTvbUL6g4N
         HRUIJ/o0O6EBOj2sEDomy1viPuD77h+S0eaTunXqd+MkhdiPQkFvWjYsaUUnKBV99NCZ
         1zrzLdn/YqKKTvKSJwvCbHWlyPwT37/1a8NfOTra6CUUc/1A3QQLmfskogG0e22/fuAp
         T3sA==
X-Gm-Message-State: AFq9FYI7XSftQLAFYnIKea4ps+lkCox5eggYbYzaC1MnGcaVs6mqbrVV
	u4OcUQBHWUnpwaPuxhCRZIi6uJvwruXfAWnxSmZiJ1gfx9n1ix+uOPkstGynapxr08ei/KaSh6f
	PD0qnGScsdQ4R8ZZlZ+2tisQeyTt8WyrAswSlskJsu/sZ4EfeHjBAQglr2rh7OzE=
X-Gm-Gg: AYBFou1fqxthQIkF2NRsr4aOwyOWpoKMMLVr8v4Kf9oWN7pkGXh1p1bVITa2c6pWzJa
	O//S+A0wflr57LbmnfTnkHsPv3S3zHyghuQVSNVFkXW36J6ArximP28ylhAtoL+1qA5KUQ9PMy/
	gVKL5LhAMD7EovldGj7ADpAqulb5bgDopIzPRWRDMwB3gCJIKRLiOWb/u/O0EcxFKsSq1F+IUK0
	q30Xvk+TeL4By/8VMPUae+79k834exlU25x+vcCNGp/bN2SMkolIve5W8lWdE+CYDQlinqs5F+3
	5fuEzLkmONewTFkuvf3HGW5GyYvccsr/uawBw3V1GoT1DWxstqzPFA64teweFI7pLxUAKJ6CDOZ
	4heIqXSroPyRkj9rqZ114N4X46VMCXgC2ug2suTv7yud5rJpfQYjpuyQk9a1uRznA6bGBHo9wBa
	srdVG1Kx1masYj+6XCedNZbNI=
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894602eec.32.1793382446847;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894546eec.32.1793382446272;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm8787868eec.19.2026.10.30.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:47:25 -0700 (PDT)
Message-ID: <683ca22c-f0f8-458f-8323-214945ae6d45@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:47:24 -0600
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KvJxtCNeVr8hhPJ0a_GECADHTzBVCfop
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4d82f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dq9AVsfMO__Ke9BKiAIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX/sGkq2yZ5DKj
 4IRMmZ4hdjU/g+1ip7NrdMgE4cMmCEKZBITPG8jSroDzj6w2IRDHyKrAddG+JO6mfAqxRO2vvWD
 QsH0T1mOTHDsx55gNCoFLxwKbctINTnRsRckDHCAB8mfN9CZ5Akl2g5+98FhomjkAlcAJGAAyck
 37Wq3frq4vvy1bevCj3ks8mdBixWTsYKP3j6IZZz0zqPAkmsA7zpwM4NQ09ZL7t2nFeyZoDQlHV
 b1dSN9IUHG7HGpYQGVXy/W0xsfpLXAnfdthavwZdgRyLVdntKXiuKsB8mw/hEjqrQ16CccltlcF
 aW/z4UF0SMPwnbEMaS+wpfaY6zdcMvgb6CEVVOZ4FNsUMJSfnlI+nhgivCkz1Hvo1ItWrRHOJvo
 HhRE/2J7orOm73LuOLJ+sJTGAwEuPU2Uwl2fJEx/koAMMP4VYbnyayyWYeL+2p45cF0AKq7wNi3
 dREFLMDUA2Nzdp76uuA==
X-Proofpoint-ORIG-GUID: KvJxtCNeVr8hhPJ0a_GECADHTzBVCfop
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX5/T8P0gOFPFU
 G4uMWLsVtd0/YpU15Zb+9nZg1Mhr2PvxVH3rtzBrzCZSI1pxgxGwOUYWSb8Y9gE65MJ+OXAt/U1
 QTm+H011a3gN9hv/wPXcjWNvgO2gtYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300070

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/mhi/index.rst           |    1 +
>   Documentation/mhi/sahara_protocol.rst | 1241 +++++++++++++++++++++++++++++++++
>   2 files changed, 1242 insertions(+)
> 
> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> index 0aa00482aa2e2d7ec4941154a8c6947dc0a0ac40..39a38978398b81727514ec95dee4e060a1063b34 100644
> --- a/Documentation/mhi/index.rst
> +++ b/Documentation/mhi/index.rst
> @@ -9,3 +9,4 @@ MHI
>   
>      mhi
>      topology
> +   sahara_protocol
> diff --git a/Documentation/mhi/sahara_protocol.rst b/Documentation/mhi/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..3190e3e5a2820628e89efcf759c9ca634428f8b2
> --- /dev/null
> +++ b/Documentation/mhi/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification

I think either "Sahara Protocol Specification" or "Sahara protocol 
specification". Having lowercase protocol sandwiched between uppercase 
words seems weird.


> +Hello Packet

Until here, "packet" was lowercase. Please be consistent.

Also, somewhere around the read data packet section, it seems like you 
stopped capitalizing the packet type as well.

Also, did you run the make doc make target and look over this?  Also 
around the read data packet section you start using the section 
delimiter "=" instead of subsection delimiter "-".

The inconsistencies in the formatting of this documentation are probably 
going to make it very hard to read.
