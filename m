Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352724;
	b=EgP5M/FVrJhCUD+YsG5dn6z79ANqV74gEtPiNoJ0LRisyrtkUu7KO0+iTKBNkAJFIqYO
	 jZLQqZR7pvWfJeDIlZWfnl864Ub8wxErtmH0Gg+lPqSDWgID43SDdHgnrbkK+RZPaDBvQ
	 Qr+H9cYKNp8lWEo8EURRBv7YYQmEckOpYwHkfJDFOodstQZMYMAtmz+jNXvW89Jx5TRHA
	 m5TPZb6LhPeksBSa62j7K9RHPNr8o95xT7qeQbfUK6phxVpmHtH3FYlX9/ZNwxoa1iVBA
	 tf2HOLvE0lXlQwyYkmtBdsO3FWhN4Bk+DUHJ+eu6HzBeBApxR2af4nSGyhn51cinV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
	b=WC0M5A7vV30XzjMBoViXhm3aanw773SAxVIDnjlEzV5EnQoP0R85x3psc1eVYa5tgA9T
	 tDpOOCqmVhMUCLCKPsIw3o5/2CeWIp3Lc2/0yLCidOdvolGfKvelI0g4+QA6n8H6YtEWC
	 s4UY+eUYW+1IZtMN2Fq+jwTs0OtWZR5eccCwzKlxKyTXg15UeI5XXYL5hkxUprjlVCJ93
	 WN0fvJidbsgA4GMCPzjHxy9BXWEBukqEj4AjWd1yZMDlfGjiPHiQPL8HblUXvlHiptRfw
	 EWipmTUuq4C5yyUaW3wU3K+n5jMJwh6x4u/cAkdOb0t0MVdVBzaCgMIVPfciECvlyNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q+iy/jSQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89EC606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+iy/jSQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKlKO501888
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=; b=U5ARn3aKRc/0s/xT
	AP3e7rZRyL9xmrEKJQDNOv5f2Dy1phwrmPipC2LpK25ZXhc+O7OiFH9cfPdcEmOg
	3oa/+DPEAHZEREiCESwy9fZmD7CMj5vQQvLXvS+xbLWfDmJ2EaCHy1c/3lbrtcno
	T+1RwunzOgV8WykCpRE8ZUVh9NXXxNIo/09UIOrLiO3B1s7qVkhG5uMjR3vYKH16
	Yl+5F4ccNw9XnJN8OJ76Ymbjcvjbge9dpZ/Mhj225hJiMOGn5B0vAtiYDQltKELU
	j/NhFqXvmRlfenWzP2BO2TmK74e0Tun9VfmOLhSOH8v/tLw284SnXYqSR4x+4Hz3
	NKb0Qw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5dbhns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:18:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5839632eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352722; x=1794957522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=Q+iy/jSQ2VYCWRaZKX7F8nhaZoUKeyge5fDs7HyinTznOJ3dA10hNAlm6GUjty6pOf
         pSHIsV5a+yb8ncyIgoLL4gGkhYXCqmGPhbGgd7QwF35+cJOd0TFfYYXIAjtTZFH2cP59
         TYBkZbH/rNjpaheQt3ND4O6198boLziwmVQf74Ek55eZMKNuzkeae5EOwhU8dlYb/WgO
         BoOvJ3nYMdtnW2ycp7L3VYF7T3pfKx/86eVNUaiLD94FHlKStygPd78U4tHn472TwIK6
         TVAttQihXPSd5BdS8qrR9pRMST3hgOuMHVA3GnWCaEN+dOALsdLrvFPet5ugOG9vsNUv
         jnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352722; x=1794957522;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=lMn/xVXEndVx14tIcoeGn0dO3+0PIUxps7gB7n7uaCyjMEtv0uqPf0JFwJ8XMlkvHZ
         BBXazfwJXbJMjwY5eGVcvKWeWIg5+haG0bUzlY8dEDEqLDbc42ukRAdr5EyrvE9u42JN
         lPAi4tuy/YoH7dp/yAnYzHgRVnv5cJoJOFMKaMjkIlNq7aNiuGJLjf39wKqZOfPWHJ3D
         B80TMv3h8rgsAk+CpwrcOqsoV5t/SQaensW8omHerYJzHH3EX8f95bW3GcVAwT/tPAFr
         GEU4/WA+dfgOwYagRElbL1wwmHFioZbTiWjiLg5avIyRsGZjzBHgHD37/an1Q6QvPsep
         jM+A==
X-Forwarded-Encrypted: i=1; AL+hErH6/xlA+OHdtsKYirrfXyWQ9fdo+qb3SlIa9fJj6Iuw9W5yA3hGphKHALiaWwBCy5ZGly5gu62wwcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4wnaAps6Hga/TRwgqbj2PhmV/OkZxorR5bZgFpqNNvcbJMzWM
	EmjYLf1QjCo9LG8IsRJJ6v8bOZq7R7duPSaUKJnbLonXIUYPPltuxRH9P6b09DAe1MJ//5e/KEs
	KIcux+6f/viTlE4wXXrfGGyKyA8BzpPeAJjL/1UjfeDRxJlKw8kpHc/qFRwe3Qjs=
X-Gm-Gg: AYBFou1TRRpWEd3R6ZMBBUDvkL/He5sreinY5qJ4rWsTOcT+PhuApMntHqe1MloTdvx
	Gd37iUA8gIJoviVkbAKnfXmp5pCnBH6ONaq/fllwxpNU8FlYJ3s8ffjiT1U5jiB5uU7i1ug6Jc/
	cItTUycVn3+g4nEhupcjWAamAOGJbTjH9J0oYSXlyZ0oSOutPs28yihG+mYzUjP69LXHEMV+uDi
	ilZUdc4Fnkjbc86qe6eFyEPjXavEXHeyctlw/KpN7p0vAB+VCbteuyK6XkiO/TMRiO4K7ByDzm+
	+HgRv1rbn4NSPiZdXYNiYvJ0bd9GnWp2FaakwDpaWrn+yf7BYxp92Q4JCEenrqcjHeKTzM82ZBq
	f+ZTXHF0EhbgG6vw0PiP/bCHqMNjmVMt8Ma1SwANoR/j+xvjKB3zOH0235kQaJDtrkgFam5cu7Y
	zXpmrfNhri/ol48nS1eM4ElqSdIUk=
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283760eec.14.1794352722279;
        Tue, 10 Nov 2026 15:18:42 -0800 (PST)
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283708eec.14.1794352721742;
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm9454656eec.8.2026.11.10.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:11 -0800
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
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110151811.000001e1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: VNBtMyIcU8FOTMhj1JtdqeZcrq3i3N4c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX0D40pQ6k7cOg
 +bxli2FpadgC0gLAIdAPVwuZyvuJQTz+0y9LtyJtamPKTYS8xwXTBfy4XDX8tT9l9ta/8RISypw
 19qF8HBoNZos3fFaE7gNGyvAhji4dbI=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af3a652 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=SRBWjgdl_vfv6kPYSD0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: VNBtMyIcU8FOTMhj1JtdqeZcrq3i3N4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX/z6wfu2BuIpG
 N7LNNSrx80G5g0P+aC9fIjRSL+75yPcV8RUee7GaAUl8xxXOR+nGJ4ZbD3lF68AeTYIQ2tBk6Q1
 i8bIl8bdOWas+RYbv6b6DlTWmMeiFpMdlHpA9YKclVn90vzepLlDu3SeA2nloQTUpQJFI+0B1ox
 ZaT8+ha1xKUaglSqa4DH3+tAyOF85aBSzGtawD08bg79Pfqgp1/qsbGfh9i7kFPh2brao6Ju4tk
 WZB0hq95nE4m+DoYQ7Fyh7dl4pcfwsvKyk5x+QlaAh25qk11dGhHjFyDFsAJtTI1Bsxxre21rqh
 tYP1XHjBMUyU6ZiGogw8yBvc4yY36MKTpHh/fFWWBmsZCR+bidm1ldjtKQ/6bVuZOjvc24CPerA
 k756U7F4IBTaWYbCtVQ4JcLVMxpJUy8lD1FKhPeg3heRhT7oUAWUSZr8mKPWfYT6A8NU0BavCfn
 XCGYJ4BjfvqOkqEydFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100092

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I was kind of assuming you actually use this.  Where does that happen as
it's not in the obvious place (patch 30).

Jonathan

