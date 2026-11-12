Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794512170;
	b=eRefcspfem5cJEw6V5L6vyT2NsAhcWmq3sf9q8dlGGi/TNrIMM9t+WRo8jcgnwFPdKCe
	 FIDjKlaw7GN8QuYBEkYrRMVP4hm7Q7MkfpYk3I4e1WHwWkbIWLO0QAyYa9LSmgbTQrk7x
	 R1tLHJ45zvKF7QOlpniXiLjDYDkcOclBAstV2iT1faRFP6cC1B38NF05TwS6zKhNc4i8I
	 bJggyBYic98DNSu+svcb//PsleGccg5asE8zHG+r43+wCVEUPMR2g8Q5WW/YhHiYVhpt7
	 iJuUkeEpecl1b2Z+4/OGs+yi+fPkM2BXH/fmWQtJmU8w2BQer5qpz9mgFOzBeX5IEiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
	b=DJ5qNlGqd5VBDFX5c87TL+/OK1SMtoGG223PlXVcu5g/7va35gomFLys5sqPEwoiCWYN
	 94UjFwsnO6v/oZqvA4n83tb3NQgN5E0B8KeJ/DOKXuh1HlIoWJkIK5OraMMv3TO8UBXh9
	 iW36CzuqD8aFWbnOIGxFkYPT6kiwX1mZi/muy32aFECVBgpUcrjgYYCwQ7Bq9iFFh3DVU
	 1DA+RbOHkPRY2vA23VcIK7p6gKZL009dqDWSuWbXpQTzBSKaxW8dfAxfPiM2E4iRJTc6e
	 OLcARqnbbH52W15Uklpgkk4D4Eaw4ORz4loeAQbYIt7SAcED0sx84lfukWL8vIzXbUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8E606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB8E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJOfl1705983
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=Q3u7I1yY3nJ
	muq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=; b=LU8nJzdqTuFeXxiCts/Icr9sphO
	9JwQ6qneW0n34BTZV0JOHdPmVmq6v/o8AAukNp0VfJtyC1BxJESUVBZnUPO6bTJz
	heXDvu278xn0fp985Ow2X7KOpGQZ22QPNDE8ZkenXzSOzsL3mE+pV15Ld4NYN0ke
	Z4xYE3FlOFj/3hNCfLYkNWEOgkL+E1fKr1d8mgMFhG4bM25au11LSDbP1ZpUQNkL
	P4j6oE2OX8TxKs7kHuTuK5VSeUo2ZEx/0qtZHGl8RSf7BrtesxK08+eNxS3Ts9nr
	J4HURg6r5rm/vNvQFI8Dm0i35N/VUkWCnNGSvZbKTT+YhzyAn8Y9jOOTXJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hwkk982q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800 (PST)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so202844a12.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794512169; cv=none;
        d=google.com; s=arc-20260327;
        b=d4z5YwqqBsR7Uugi+fNjDsm1p765LrXJiOMA6R3c97iOIrV+2AlsIRyoRWMAZRvVus
         ZEfxIic8VpkoUgTfAKWMLwTFKR32Tq9HuejtRodcR4qS915nUCT9mmZx7q4/YaqISsYU
         +7BvOVZvrnbDO0uhm0rNnErCOVa6DyZZcnW+RlZfGhrnSYQGw1ic2qwLQMikG11mZTMd
         I7X50Xd2xkFMsITv+V5F65I5Ft/oijwHatDKSwnQiA2sGuIATe94aLDshIjr92ikHSlm
         fSfPWOuWYX962Auv4pxubVHAjflvVIr12eT+XqYe2BanskyEBgZYFnh69gYmczDvDseN
         7iWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        fh=nsJWR7Ur8yU4gV3YRfcX2qPkLZP9tvXvjezQXPtfRhQ=;
        b=n4I0yoHqjko+Dk22m9ivBZM58x1SkB5wA6yR2k6P/kivx8rkaeMGcASh2Id9mcH1yx
         xiivJRrGEsrHMp0n/SkyPo/d6/9jcZEkMnuO2225ktXox07/3Uwwmh0HQLr5JUJ4nbiv
         uuY70DDyXBOlfH1MY1EjrKsoOiAFngvsCMGGHCmysG5m5AdJOW4Z6f9SYZVhXJr4Sa/y
         EuqcUsCyGG5MZNJTKZFxnQrD3pxgTCWMJA4cJrPiYYlQCshs8WQ7/ayd3laXrrKdSQOR
         M8TtL1UK9D+2XK61saHFfOywtGjWHNUXs9wuyUIvwgjvZ4oWS6H0GAAde3Ekti66GcFS
         uq8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794512169; x=1795116969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        b=zgsCww2McLUoZj61TmUV7A3W9B8L96CK5+LpYOLXQQRKZRAQe/1zpBzIXZwwY1wrv+
         dvb/5WQOsK07QEWSI0YBzAAuXTVCPNy6QYjc2aLZEG/H5xXjRe5ZSHAqtZF4EE+qIj9w
         fan3yyBzB8zq/jGbxDF1P+ZtIJie3VbT1Bxj0rH/9eZcxTcvrS4bcNefdwQ0jEoK4eDJ
         bxTbbZx/2Rxn6kikmBU21iiNqFlYnidHuIS2uDSyQpKfodtTKiUDG2U419XWdSAuby56
         I4M8Cw4Ecb0CwwCwRrV2ByEX9irvaYhw7lsYKIItLLq4JU3gsZbGvgo0iPJGBPJL0QRz
         hqKw==
X-Forwarded-Encrypted: i=1; AL+hErFPNqOS98r7UpBggCLX6AEimzanBLcVDq3W+TFg5wL5+7/TTHrrx7GK1kVhBtH0i+ITJyUSl90MQHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZEnDUHDyhRA2KsYDASmce2lgnxBG+D8uRSyCccJuUgaqPA1ne
	2PpHOklL9gUiWQMlvkto8wsa9Ckd/GNG0Nup6ytmK9bwsmX/sYnwh3WI6OzALgw63ZtABGqigdl
	yk6/SQP1TnD2AVSSW5J6dGxMp4VpDXHL7XEyXasQQVXiXrAOL2Mpk7qCNdNBYMXJz2X2gf0Bloj
	3ek9usqhQsgYeMgAe1Ee0doSmLNOhraSj4bR4=
X-Gm-Gg: AYBFou1L9v1RfPLoJXLQwtoNzqBGU6fgH+QK5EOM4Pktu7jIhUGkyzLI4xspgwE5/iF
	rHjdDqvvCJcVOA+yx0F01pkFzDiEIdb5QCy3fhThzCeqs9fo/VUPOXlJIpBe2jSNYzVpb15nUec
	KQHpP3z9wdVfL84bm+XjU5M3uG5qphZHrV8c2KaVGNfJDtAssqY+wjqF6Q+I0oJNsQ/YJ0Dr8RJ
	bL8DbOdvylhoY2cPmGDpF4NRa5xOzok
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr163989637.26.1794512169085;
        Thu, 12 Nov 2026 11:36:09 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id
 adf61e73a8af0-3f7a6e9f331mr163970637.26.1794512168673; Thu, 12 Nov 2026
 11:36:08 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
In-Reply-To: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 12 Nov 2026 11:35:57 -0800
X-Gm-Features: AclHuK-L78K4XX2ZOiQNpBmdIZKiLWCeJjgy0X9ZblQI3qzdXkkSafaXrEWKuy4
Message-ID: <CADh2yMzE1ipKD7N4YBjb0oP1Ko-Z5J6uN4k4_kK=gosHyfsKWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfX41kCiSS2zjGC
 35/LO0aqY3IokPeZRir4tk/BmkEO71E0GLebxcGylREkpOC9jQVv2hB0MuY6sOQkrhyQNILsVK1
 em5uB0/l+DoHrouk6RzyjvE8XG6xJq0lLtVdHoGeRPO4OmVoR042GSaReiTDWitOS4Qd76to3mp
 0G7E2fWv7B8jz7Ll7Wtugck8SgumVuafkq6Xs3+J/DnINwjgteHk6SJ8a/WPfnYuzdtw1dUBruX
 AvsG+3aJQw2a11BDnJ+09IgBDrW2NCFTNkw8Sf9URwSrkWADWCq8j/+G34nGBrNJoMDr5mGKgew
 CbCnwPZUDs4iyHSnjR8AMtrrP3E5pVkbA3Ia+blsd+i0nHevLMF2bTTx+Ea/rdhNT0Scol2Sjx4
 +4rBlNbwanDNdYOz9B4Nhlbn5sHk6m2bMhaJkQqoY5TK/ra8SFi8A6aCBGpR4hMnKCV/83/uOQF
 y+RXbo8Qakx1pcCCQbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfX9avIClXbidUu
 Xt5ZBflUlXVT/29PRYaqKuwaz0niqVLSiiPhOI+StEbdm19peqDgtlE0CD3S67kKZBy9eWhSfRO
 P++mXR2SCBnPip6UIWKrfTZ6ylvuw8E=
X-Proofpoint-GUID: iupAKGYkgvJfPz4Wn3d9TjVfiiXtDAWY
X-Proofpoint-ORIG-GUID: iupAKGYkgvJfPz4Wn3d9TjVfiiXtDAWY
X-Authority-Analysis: v=2.4 cv=GrXXaU1C c=1 sm=1 tr=0 ts=6af61529 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=FSGtspZVazLKPRRdjFEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

> Some of these can probably stand alone like the bpf decrypted, psp encap
> helper, and timewait validation, and be submitted first to shorten the
> series. That's just a suggestion though. If there are dependencies on
> the main series you can ignore.

Ok, I will re-post 6, 7, and 8 as Fixes to net.

-Todd
