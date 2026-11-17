Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954199;
	b=Dn7n8bP95NY6RD5zWwzRs9EWYtAXU6typM2FjqhvMI9EBMr0F+iIykfRBDLQC/tGTPM+
	 m8C6b5+vHfIeE7xWDQ2qnuPSAshWxM13QaO58roNdyawuOpISe/WgpZNpGq/f9XAUn8go
	 FaY038Ol19ZB9x42BwLh9D9wFeilF76tB1aGfh5XzH9gLPTIVHc1kCIfS4P9B5OmUzvbD
	 u4PcAddBeoktuNYtOGLG2PwR6pyZCtl5EDCbzEtuzbRw2n0gW4yROShI2ZWS+WSSfZcQA
	 z/gDKiBwWRD0YQPuyWY7GRhwnG08fJygWOXpz9XlSn68kdvrVDhwFwB7HI3JPn0a4NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
	b=H2jcM9gAc0EF0voyD1Ralli+NkYaimxLn3f8Q6iWHd/ChHVaLRHhesAn6+6GCaiEtMgL
	 Z8Sos9OU0yrcn3YPcTUnpTgzgaYWrPCey00O/Rm91gBqOmZYwtgqKrjRmZeyXStjM0XpI
	 lHrIEmkKsoqpxpCU2Nh+qt7weT/r9AAjDyd3z8y1OgpGG9PgJ3bufiYSoUjua1NplT1S4
	 uwhcKTEJUqT/XqOnbQoS9I9UyzeA3NfQctWM2g2TQXnhwoZBhzNBDLJ+UhiVOdT5glaFS
	 1ylQF1V3IoS6icsU7FcAaKsqiGJU2GlmEptoPNdR7AvlLFrLYJXnvXz9IQMP00i2gwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F04606A332
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F04606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1t5H1940108
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3q13oIFHchX
	PM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=; b=PUEFdh7q5L2JYPw6JJBaFQxI/Q4
	sFzmHEq56Q7i7DCKlM+eBGQXCRALo2QecCYubDNvHctGTlp0t29rtrCt/ksnr/5v
	MYsaGrCwNt7LmrjIEzawBTBesaGCkpwbxnW9OMdlOtzRsR6B65xN5wcA1TYjTeNv
	lvp1H9CHHcxFrUxTA8y6bT/iQO3GLfcR6TTrPZOk+QAmiPz69IHcxbJ8rSYZuY14
	yvPAyZQf2z+g+EmeMCYhDgdvotkNIEvRlGd7J+d0+0Ok95giN7Lrl4QsrNYzci+E
	Ay8F4cJoZUYPPDUYjGUVg+o/we6jxKs1DNWxx2BDTD8p/yy0EZinKo8C18A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0px5p0h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so193843a91.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954197; cv=none;
        d=google.com; s=arc-20260327;
        b=QfLmQ3JYmTYg/6WzbGwmZgpXNwO/4kVb+21WcItiXdN1tWuTFNlzIGleH9gFITrScY
         X5dcRUFAkfg7s4flelXfw9tNhkiSCHS1pef2AhCR+GQmfr+07C/21j4c670hL6I+fUlL
         axPegrE6TiM/oAdux4rIAMrFtlLO2HB6qAfYEqx6KR1iaJoIRWkUnMaZCdFjsdKrcHfa
         OA2c8c8D43g39f/mr+sQ1WUEL586z2EnFOWcssj+y3bTfJxKDTTFlNyvWOfB4pBseVwR
         mhZPEiB22uidmcMJ/lW17j2KJbn9weTFAGHrsdNYeJ+ynDbza9XWQTPY+pQB7oRevlHk
         fRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        fh=JevpsGdXN5glF9wA/P5rI3jhyqa5oFN9zG2u9LLblH0=;
        b=CjiqwpJ8X59QMOIYnwsxrK5AlnYVE3UfMKOQkmyETAuYB09OQRMVnjb23DrzsAvlcW
         /bkhXN4WDWwIrvowdXIUQ0Nm3MSRI47p0MvBK8glTOoFfJfWzpnTB0uzeAHZEjqyixIA
         LRx+uIQF06Viv6ndy9ZoQKo0ZrsCRu9ctFi2xZ0UF9r59Ae976iCIcSo2aEIo3HLYv1y
         DXdpqflezrq/oK6HVH+W/m6gs9qCPYo7m9onf+O7Ike4n1/kjuHjfHA7UbES31LyZG/A
         MzXp/W77S2RZ/qUmejNfrxCHgG9KJmY5+QohWNXIfJSXRg0//2o5fYRV2tKxWyPA0rKn
         J3uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954197; x=1795558997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        b=McI1FfHxYunlZOjMgmOy0EN16fovIiOqKC1OZC9Csrh8MgGKfBSxGq84pjDOykQhnT
         khx8ppkP/O8pWBg7FI1d8ZQ5w3O1jdA80UfsOnWyclrFISzdj7Uny5SgFSyL3CQQTs2d
         DZAO8TzxZeljJH9v3zMAUwG8QNaxWkng+p+SYrlpr5hfs4u1tRqGFV0rUJVV83FkrXjP
         ZbvHD8vQgNBnI/JnnlX66EXgV76d2WyHYt3yxONonREkDfvPJ31NNLRklMUJIzNtLmbb
         36EQLshebmAwiLFZnhhaRcv1o/ys//EQ3RipfKGQyC3rUsdFOIZ0St51VfGIk2QCnN6O
         LShQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ0xy6mpBSTaP+gFgjdxQZ91p2nJ4CN5qYsQdCsiyhkOF1J9Yr6i/rJomOF+BMQ5cw1VmBXlQkjog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kWaI6V1iyeD6p3s1UK+qki9MF2WmSTYKsnrabJg75GVheNorD
	5GG7M1+QOXY06gac9vbIXmn+SNXE0aLyy9PabboVwrA9PMniKtmQiCJcIZljqSahCMLkX6EdgpI
	7C3dP4vltefKznPUKlJTnYjqlbbwtEmlad0BdyaRoTfzk0nZkAwlQ5nuwFUoRMS1qwjIpKBYmVu
	ECRS3bpilMKQXMzpAiR4Qjm3f7bEyzLGoBtBE=
X-Gm-Gg: AZFdTZeWqMReoNodYL4Ntjb/sX7KW5IicQJ0XuO41ZrkVnz83EsdolNlhlFbs8ifTz9
	xM5LgzmaXi0XeEq+XHyotnCUq0yWTSsS5dZf9O5eZzmM+hs48d9pvj7sj4MoCSMbw3y7Dbe3ZQm
	h2gJ3zDjd2ScUYWXGi/HMN12MvoScq4Y6Bk5mo9Lp0RkTtKlL/70lCqtpyd8b68TA8Fs1MNLDoU
	T+w1wk9UyYZWAXks1cLa/UhF0NpuEvUNGznomakPVv784lZqlQ=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr668829a91.13.1794954196833;
        Tue, 17 Nov 2026 14:23:16 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr668796a91.13.1794954196341; Tue, 17 Nov 2026
 14:23:16 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-6-toddfreed@meta.com> <179471269695.2199510.18062590833471363525@kernel.org>
In-Reply-To: <179471269695.2199510.18062590833471363525@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:23:05 -0800
X-Gm-Features: AclHuK_fZNKIqR9h7_djkUI-3BJ-ndjBhRGAOYb0D1EyikjXTaP2ikjH-ZrZrT8
Message-ID: <CADh2yMzkbDDFt00Bnd50HPFJf9-HcKHA8BpfOikBUPHjmdZaAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 05/15] net: add METADATA_PSP dst to carry a
 psp association on an skb
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX93hwY4NhZwyL
 QTclrLDinrze9EoH5cTTN+MV1Sr4kHT/s0BRFc7muyQ4TsZITAmqOKD2/Ib1RUYeUMcZjeBtWQ+
 KJdhunFUhgVj2VY2BiJjwiKwpwVKZRc=
X-Proofpoint-GUID: DPqFT3M_XORwdoKhCX0_lwk-WXxX4mcR
X-Proofpoint-ORIG-GUID: DPqFT3M_XORwdoKhCX0_lwk-WXxX4mcR
X-Authority-Analysis: v=2.4 cv=adD0Dhot c=1 sm=1 tr=0 ts=6afcd3d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=27JUocoGZ6S1wOk3j1gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX9p6Ho+6c9Vlg
 QNaEigXkmBsHCcmV2xRSOpt3Nm4QASyZNsHo1AesFEFuRw+FOKRc6T1HpZMyHdkDFB+jri9eec3
 E2e8XTk1CuniSxRNR49MHJuWuAhdBkQDeCDg8jjRzTJLNVbz44ZfSRHF7bWlLAONS0XGrkKZMRl
 QF812qyWomyuygCnqR0W4PlKUND0DzcXUKOpLqtnYt+YMJLyF0Z+5hSxhJyKo8sBKiiBRSvaMOB
 vZrSYP74fC3TXuDlv6746BoEhdCC2Q1boDAsHBw5GJz1UhwopFMcrO9jG6RZZwyr9n25hOeaotC
 NoggHY/kZRE7bOhlnmWGq+uJMC6leqX9ByW7ihB7VN4yTdZPtrGEHsJ8zYTkUekV6SZpaa6Hmfz
 1IQIWXpxOzuDu2rgbeQcKsyXIGznm7iZj+S9Y76qY4ocuqe5KS3I0ocpbke+kujmzGy6wFNj7vF
 uCyirOrYSypkrGF3k1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> The commit message says this re-check handles the case where "the psp
> device may have been unregistered while the packet was queued, and its
> keys deleted". Does that still hold for skbs that get requeued?
>
> ...
>
> Can this hand the NIC the id of a DEK that has already been destroyed, and
> that may have been reused for another association? psp_xmit_md() would
> catch the psd mismatch, but it never runs again for this skb.
>
> ...
>
> The socket path through psp_validate_xmit() was already exposed in the same
> way before this patch. The new METADATA_PSP path, however, depends on this
> re-check to handle the unregister case.

This is true, the checks do not handle skbs that get requeued.

As noted, packets of a psp socket have the same gap today with
psp_validate_xmit().
I'll send a separate Fix to net that covers both. v2 will narrow the
commit message
and mention this gap explicitly.

-Todd
