Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954007;
	b=HGmccNplfphdC5nGcFMYhgxy7+i6b4j7Epowgcgi2pK0Cp8oLufojJMzcUqwEcK2NZ2Z
	 P9vZYOv4ry5hYIL/Ivk9NNjXR89jm+nBGnfuTChLDqoNWhcRfWBI3w7Cy7OI/8592z/95
	 sArGE9uxaDPP/yf9r07FljMCwyk4iKQ/xaLvsh+uhEUorU2N7/bJhcdHneAwnXmEwIIcA
	 nFgmXrzJmFbHgZkJofucKLsh1suQ5RKzbuLiiq86H8Du7h3zm4+PsPAlGalZpD5l+s75l
	 gm9sYvHNU0Ap9FUD40RtlmmHlBXVx0nNoD32N5sAqa9/aYXtixc1EXv882v4zb13t9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
	b=bjhRaUPBBjzHSRef0fiIrGT2Cru8xXQcGfgr0JQnRZnUWOjDSk2FoLXY/BHtJ+SuCiwL
	 YG4NL6kOW0M0Umr88ahpf4B2NoFFa+phRN2TNvSWJuBkXSSF2zIyTKcKn9fCzlWk7O4Ts
	 njN6DG4BPzhCd/2HTdEV/GtXNe51cG9CIAIMM8HUQrzG8YFhDE99MX+EwuFM6L6/if5L7
	 in5Q2XuaED2eTMQlA4UYxC2eAxQ3OUpn3Nx9iSoOxtaECU/f52b6+JCiu0hXRw5ejxWIM
	 yrVg3QQDuf3okJMx4tLNyf5aEtSlctbz4jWYwBL2Xl+Ccm4h0FqgGTekrQg/m+iC+Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36AA606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36AA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1riw1750102
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=MrBB22VyQQ3
	4wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=; b=de3QWr9uJo7zpRux5nSBZrQPJI1
	ZuT9RzWRGoDJ4aCQ9SrU4Xxw9lwDJ7b3OmHlR8+w5tIEz3UPpJzxlfS7NWR2ntEF
	Sx5JJxBsNLgjr1SvG/Lb2/HWRTnrHpAqHnl2JEhCnWbe7ecSMNitIJpelIQxT7L/
	5ownN3a8BAw3B6TX+M2l1KOePj+0a7YZornHlcIw3dusVrCnZ3PNUvjXrb1W3Jbq
	9eI4VDUod9rq0HPbutUCHOxnMkEyvDODXmpDon9TP7Jv9fAYKQLTeTydSUIZhpUC
	6/Ldc6GrPMpfUutcKYiSWDp5WJmepsbra64rsMl8Xl+kkyO3/xGEv7ORWJQ==
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0rk6ndgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490d2ac331bso264320f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954004; cv=none;
        d=google.com; s=arc-20260327;
        b=HvbdRbidGG6ott/sRPBzMlREbNrxy3P3nZ15OQ8ugD3OdsQebHSGtZa/1bwtjwGspq
         AzR2i8J/ELM6KUlNMQECIrVvrOCzbZHpq7F29Fy/L6kZLEez+Oy9sO8WZhAo4WG/dYOn
         F1wy8YP9WaXj1lwCEsI3RE8yFGMCJOdzUj5RPCRmfKZXH5QAkTnijqS0lATobF9/swdB
         RgbBLvu8ogPEl63kNnHHkaaF80aw97RhZEle/6qCs8zCxZ+kczbsPY9dSAP7c2Umx/Th
         VYzE9ADw9Bv4yxcNHND2jWUxnSX9SFAvfxVQJKKZJqVX2K+6atqDVOsX+snCsz1GFceM
         JoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        fh=KfTSSH/nS0Rjs6eDxV0dRZ1G0ocObTq6+InKdbklvps=;
        b=Cf2BsxTvXCnozAB7l8L6tUk7MKaJf7Y01pwpgmWib3JRNl8tQFNYzoe8iD2XAs4YpK
         WQ4wXHHJp/HsapHZ3p+mnIrF1JypX1eZ3JvdqyVM0sBMZO+rOOe1rF7Hy9qxDGSOygSE
         Q6L4wSyv/KaGkC6P4S8P4hWAKkSAhKa9yIPOKm9AGf0y+mKyg4Yxq7Rleg/AiILQdfXy
         teB/GJYHheV3YpsxG5y2u2KfIlLxJ2LfGh/Ps9hEK6UxgXIWKCgZZV5w/iUS0Oq3uFap
         vmrkG+ETY0BFI9KFFqmUVeFtBEtduSLGdCwdk7MnWZ1n+E8CkPFeT8aHgX4sUG4PehXl
         PT8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954004; x=1795558804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        b=iOLV79tVxVaYOZyDn/cVTsl38M1xvA4l09+bjAqVjGS9DH7rc+xWGzfheb72spQbx+
         I8SL79hHgZFq2C7aDbSD/QkYonGmvDpCAo3zl+d7zfBcJtyjS3C5J3KzwdEvpET11B8d
         GiI/VqxKSJIOP6T5Qz9Dge26Q9P0HRhO3zsG0jOQATTAGu5jJ2o0E3HY6ZpCYi+DETH9
         rN4whNNfd3DVd9RjgBMGrr6hqTGvDxJL5zy0b7xQ58MaGYAFL+FVvhhwb3zhKfBAsuiz
         e44MMGJ+iX6iYuFgCmPsVN91KCkhk59rCs5MZZQQov0FN+rFwwevAXPLE05yPJ1nHeTM
         vkEw==
X-Forwarded-Encrypted: i=1; AL+hErE2N4KqcArNbEYPDHYMyvqtpw4iDvfAUuzgUajsKQ7x0dHS8YkmCTThiDu8D+rlnSlEEed5Z39Txu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UZgBX57OcimgAiAix3n8ap0HsJhcVUlR7boCtsS4MgJB/XKse
	vxkJ1zSLI2r/fpjnnM+7b+JAvox3ygdclxQKdg7KOOkLc6q1UrynN1zemoEOrOYSZl5kCi9bH+u
	LF2ursYvKKK00oxr+v6GVmlBn+k5BfOVu3iOEsjS69KQC2RVXd9aq3Zmv27pmtIVIoEAhTAJmpP
	yslzp+4eQRenisVK8D2ZPqgbvsX+cwgwlpXik=
X-Gm-Gg: AZFdTZfipBg6quhwyUhnUNDQNx1wcG8wnpbiBv9CuMZgt7I9+vlyCYQvSTsw92US4l0
	vPbqM/FuaZmv6oJKjidelrd4bcwlPgncy8cAktsbKhOZMqRfzRilwVZA75R8qvQlxxMAtcg2HQe
	WBfqek6dmN2Fu9IJ91Tk6y+ZUbc5ZjgRKi1TKUvD7q4F92/pKD1fh0N5K6qAHgR10PsQmGUF+hC
	I0kPFqO+mx1qB/FXQxPe5Kl74QzbxBK2uTLGWOTnZeyubTK6K4=
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id ffacd0b85a97d-4a6331c6cdamr2082674f8f.4.1794954004398;
        Tue, 17 Nov 2026 14:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id
 ffacd0b85a97d-4a6331c6cdamr2082645f8f.4.1794954004046; Tue, 17 Nov 2026
 14:20:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-5-toddfreed@meta.com> <179471269504.2199510.18115986956046547098@kernel.org>
In-Reply-To: <179471269504.2199510.18115986956046547098@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:19:49 -0800
X-Gm-Features: Aa3M54pE3seHebOeBtbI3cDpMgrW25pWhWq5MbBS5In6ZJStfYB2VZ8sEpNY7Bs
Message-ID: <CADh2yMyRSH4ZKZaGxFLVXHTE6v3XF38jh2OykqXRxvP4=0TKgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: QLs9tXY3bCZLZKweA3GThXJGJTYzmuim
X-Authority-Analysis: v=2.4 cv=Q7xHcI2a c=1 sm=1 tr=0 ts=6afcd315 cx=c_pps
 a=I6ewnrIBtnKHmb6SxpX7Vg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=6yLQ_yHwUL-M3baYCL4A:9 a=QEXdDO2ut3YA:10 a=MqNruPmfsT8GavliLQMe:22
X-Proofpoint-GUID: QLs9tXY3bCZLZKweA3GThXJGJTYzmuim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX1JsW8KanW54J
 Vas8b3q3Ez79OR+TDffTekbYG3LzT/JF6wrexQsjLItQmu7kZH7v5I8sE5SV9zXSqwCXGoPn7a+
 BrJf00unlTwoYXj+/ccDBiYRsV+/5wGMXKEs6x5RHp6+PZ5lz2E9WxN6zuLyek4ORkSTPuq1PwT
 V2r2XtboiN6iHZTmCQTQlVkzWT+Gt5kCDyWpDsuo/dpDl2tUtVFujouR1E+sZEzdSiufPgDfzNR
 Lsh01OYOgeVVuj42ePLHY0vDt+OatRRV0Iyf5RLMuznBDs/HUHGL8E+gJwMJ3mmdI/YKqJtTYCq
 2z9PPboIkYUUYZ4nWhywACJdqbCcQOFK8P9czvypz+gUYkJejkj4JH8hlzWBXF+xIJfiEQzrdrA
 DV8Etqj9o9hnABGOAReHTZAAubEcIj7umYe7VK7tVWzIKYPgWq1nhYbQUzH2yyh9rh+JeygVEYf
 aI2wxw0cPft02uqoEQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX6S/RL3rvXZK+
 1vjknWYRXTDr1pW7SR2Exg1MhS/7ZwTo1mfxSssS3vYhKiQA3x+/Y9HFiA9dNQKx5RrHPcZr61Y
 WN8SphKFdtA2ZYvDOwHPj+L6tqdcVx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> > key material enters through netlink and is never reported back. no key
> > is stored for rx associations, and users reference associations by id
> > and never handle keys
>
> [Severity: Medium]
> Is this paragraph accurate? The code in this patch seems to do the
> opposite in two places.
>
> ...
>
> So user space does handle keys, and rx-spi-alloc does report key
> material back.
>
> Could the commit message describe that more precisely? For example:
> "the Rx key is returned once, by rx-spi-alloc, and is never stored or
> reported by assoc-get".

Yes. In v2 it will say the Rx key is returned from rx-spi-alloc, but not
stored. In v2 rx-spi-alloc won't create an association at all.

-Todd
