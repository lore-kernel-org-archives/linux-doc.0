Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878428;
	b=ABE/6tceJudtjbmicexXtu0QuigFNrQNTNN/YSoKcrD36zmGujmsRi8z0x8yV7I0a7Mm
	 B3HoMB79w+31ZKQ7KDfsbXlITeMpRGR6XXdM+Tz3Cl4RIJYZg9U9HD8O0iGjHSFJhaL6y
	 zvtoO/cMF03U+h78ixIj9XLZqWi1OulYyP3Xvzl0e+11ZOmClPPGCj2ZM5cgUHUfULO0n
	 zYr8I/tLmpCoQc9DvqXrX1m5Pw1LcCF7yKuzmFdlBi7AnW1EUWJr1R1lyi3rkT5XSehAR
	 tLpjPljyXfqL5WJfRclB8G9FiV6tdPMNDIPLI/pxQyo50A4MisO4XBBP8dM7S3R1kRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
	b=LHPinh2RfgYGuZZIB5tu1C1aM66RQoJ+VX7EdTl3bbCmsrorH79b0MKkyNYsZ8ZY1Aj9
	 ie7Y5RtBhP392MAnHinNFkDqWU3A1ZlG6p2JUWZEXNnOnsAb50iEJOCrJJiV/tuZfO2GB
	 +Ym3ukCgKDNhka2jIyfG2NoLOZYsL3kBWg6czuiscoDcfxi7gwsyC93zZNFT9Q7c0pBUk
	 HmK5FJoWxzXWUNz5ex9kE5U03xEAuYop7eWcrdL7tJlYMlKZmAGewVR7o3f3PDnd1Obsy
	 zmyrW2y6A/RQDaEHaGWy61ID82KXlwuao/f92xMar7cSBSaM+W5PNsX1jQIocfEr6xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA4606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 15:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DA4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51d016c75dso291116666b.1
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 07:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795878426; x=1796483226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=aDiuxX8W2+gteVCIUPG/FgvvNkM7Mmoj0rNnHSgJohxEqQJzvIbLfTx0PT3mHW/Y25
         TGN/ChZmozRhlPn+B7zhaDuFTbXHvKf42CD6eJwr6loO/mR7PdYlwhxM993dIbsHCZBq
         kdwmOqCAmLxRKMLOsaMEio51Dne5WhDXBU4hIKxLXALE0iajF2wAnqTIKZRppecVMIZA
         hk3hpnONDCMiDFfVrV5ikOyIAdz7LZ9HerEyq2PLh2/814ahKeRlAns1VJKX8cJVZtoJ
         pv1RtKe0VPbq46RR18/HFS16DxTZrxjXRXxKz9cqwX2Se56qKRqwk8Bj4kPX14r8cDt1
         LWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795878426; x=1796483226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=nLsV7PluKFOOwDe00yPs8tfNmMdiAdj+P1y4Xzuj4+uj40uz/0yr2/2nPFa6HyDVNL
         W2brKKPAyQp7rEHK0NQKGTFHIuGEukJnSqBD8llmexjgJgVc3eUKKOgHI7V3xme2vnVZ
         wNoe17m1hPZhzaDsoXomkjAi8Gpr7As2NZJ98g67IJuy0PlVVexl1d8PNSDHWzDwguTv
         P8BtoAlNjekU6jwppjzWFfMqFmY+nxHwiTib9TP1NC3kfaSdFqp95LyXo/0NdAmlXzo7
         VIcuT7AWuvXAWnmJ3AxtWPyUBkzSae6W2AmN6LTsKThqKp/NqEMSNpQ+mjfj0TPSjWE4
         Fd9w==
X-Forwarded-Encrypted: i=1; AL+hErE/lRMsQqRmb8+CzxF8Z7RrhEVQOQYo15efGF6EvIC6K3k+SaVIaDKxRqyw60VuWnKTevMdgg7bNjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iE03myJGHgdv6LlMLfagz0h+/ymRq4JD2+JE5zPJGM0jQ9k1b
	Mek2tEUQLqkgVGtciqmILY/mdLZNnu2ZDye3kTWof3WAPF2waqS5MdGIQTbOITXk7A==
X-Gm-Gg: AZFdTZftD2qxFWfgklRn+wLtgG9up4vEdjno0lQ3LEH3CJICbUooxdpjyVSwvS4O8+p
	tjDus8njsAqQ0HDH9pFcbSmbLQjZduSzf572O8HjcXy+xCDdHkNS6552C2cWYGCzOIviRD01BMd
	quAeHK45eRTUZded03ZphVmAvPHbPx84M051ztcDA3Liy+02Fk3OeAmges137Sex4+sZWIbqOxK
	0JZESccjXFMpELpsrzUA3NhBdf7wcWmActpQMt+QM/H6ZoqFL2uQ3FgVoMiYQ3NqEZU9MB9it+N
	GICpMcu/gEvHISjeQ+8iigoJ39x+4MGhgxYShn4l1552iPMl9HCiqkUrcZorHvWJKCTkNTbsI3j
	Tkh1Vj90248kbEw+JgUlND7GcaHsW0XgmHuS3LMA+yKUs/l1mnRZh6R6KqeLzuESju5JZ+xUmlG
	bjTaW/eF2YUpfK6rM+JOcchB0x97W4n7JwQg/UO9tP3IbkIq6/2l9jULyHj6MXkECoDexEeCAKa
	sTZZvQ3XuKos8+oKIuDuKJlNAeaISTOatum9l7jbcf8fs2lXpTeIqpHj8Vng1BUANb/xsvWowMX
	S+2ruUq467wwLN4Qf2c2sxycseGxt3B38CKXWkyrjrl7wqqN7m9hspMgJNC5UO1ocYjrWcoPffb
	9v7l5cTFSbFjuhjW6DMY1vzr2yIRtCWQn7QWx87zMPfVmoQehjdTKxUzJq29w4lap8prgdcGGiu
	07FpZ2t1L40xTsOdmn7ZAg4rvc2munBRwclss0F91AAtcRiGMT/kOmYnbjZteep89+q1OnMFLEZ
	/Z/B3qn5P0gjcbnHDTmFLuLGhQaTuXU11x5ADetqLDX3DMkoncNCF69NbVm1rYhpHT0kwwCV321
	1qCWSJ+dYnTooA==
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr1751678766b.14.1795878426093;
        Sat, 28 Nov 2026 07:07:06 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm965372266b.37.2026.11.28.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:07:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across tunnels after GRO and GSO
Date: Sat, 28 Nov 2026 16:07:08 +0100
Message-ID: <20261128150708.2702219-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
References: <cover.1795284858.git.julius@bairaktaris.de> <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de> <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/26 10:51, Paolo Abeni wrote:
> This test is very unstable:
> https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

Every failing run reports missing segments; no ID check failed. The
receiver read a plain AF_PACKET socket with the default receive buffer,
and packet_rcv() dropped the frames that no longer fit when a burst
arrived while the receiver was not scheduled. v4 reads a PACKET_RX_RING
with room for all frames of a case and fails the case if the socket
drops a frame:
https://lore.kernel.org/netdev/cover.1795869698.git.julius@bairaktaris.de/

pw-bot: cr

Julius
