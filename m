Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608686;
	b=oHFSf1HCwqA5S4fo9vS6v+zOT1Bdlv/Lk/GuY/BvhBs6lN3WbxKz7HrIs2CVM09aLWEC
	 nEzc+1ClK0IHxJTGVAsy0tlMAai6kj6NVQ+iDppMSu8WSDtwuvWIOvlx6DPZTQDplq60Z
	 MZgBSZO/queYtzvFLhNItR3/KnBolh14oTSB/KVJ77uUkGPWSWGWPWh4YddhCJmOnqhu9
	 Aq0/VwbJaHCvAeB9+EnRwer3+PEemdLr/q7t5687ZynvqA86pxTel/zVZM4ZObAB7GkVI
	 Ck+pA/DIQ6gHkkD9fnh1w8bkfkXk5G1sZZImGcvwCM4vHvuTmuS+6hOp4eOua5s0rRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
	b=qsPeYJgHi+/2aDLGUiMKwRVDYqd3Th2i5dz7s9PtXcMjrt3+nmBTsB+r3E7m0WPIaBRm
	 VS+Ykj8l19g+oL6+Latcq1+QdjvQZgQUlBR8uzualcTe6Mcu6MZy0DD2fTNiG37jmmB6T
	 2QVrZaEtLIWNoNcQm/yt/ME84cvIPdIAwIRiD809Tn8stpu7phoOUwZir+U5GbGnUqnL3
	 7nJdYRbh+8qwH4CwQXF9nz+bCqRW/kky/OY5LFXTUuVxDOPRFSZGgt/U5f3PomXokflw2
	 iZbG3MxrwKdOBDW1N/RS8T72IoYNlpP++DAuBqBN+wnAhenfDxGssVU91GNNmr6MgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029D606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 08:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6029D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1099643a12.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608686; x=1794213486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=ZrsJKdvDf3wSjGkdXQOysAvdloIM9KYRnDXm+0wOiWS0uikOgM1KqCpoJEYqwbxZk+
         xkqunbMOpYJB64pTmQJymcXkuHxOg6jSGWrE6dIrZSmUDVT3rYmaUIMiZy7/i9QqAWRy
         hEL2Z5u/HKyG2GRuzE/AQD1mOn+XtY0599THDMTh8a/nrWwpHVVQimI7IMrlxxUGHv65
         hry+t4HYRYGPjHBZDeue/d+i1FnjE+i9e2LNGjSrrAdPDbAVeazDGEYSe5zX2FR8AxFv
         M13C4q77GkhZiXGkcyv8FoMDHMjW6TsrqGp3zWEDJOGqzl3mdGc5Xc0GCaIAoQXXsOVJ
         hbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608686; x=1794213486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=kX/5jSebzWcWAS9mxhKK8ER73DlffYUlgfTnetOPFejgL2GDcZqOAAqNkmZu6z4WZ1
         EsXNKJLVr6iLTpHmA5AYLaGBxLd0HKTBD/8frKvl0ch2msZen6pejCDptFDxPxAUZQj2
         Q1lWFOLwZVr3TIyfeWNusxImq9F9o21/iwNJdTBnfWBIVzZmMhv3d6uGY2BNiVd+gWRZ
         kd/Cx7GVvGzKizP++8jgTq8qoFUWcyPprO+fLGYJZPLHPepSAvhf135E9mkMoYuHxBeX
         ueVj7zogvnGLqR+bg8ycnhm77HBJvmALVBOID336dXclqXctWsDJtT4+olqGrluQB6bW
         H2/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/wujgNe5XZkrbOAp3n5M2Yn4f1zDryejARvLTvgiRljGa7/+Xzncrbl+K9b/w61fg7nubI3lrgMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I66k+bKXzo4J3mJAccAykoo8zBJxAr6SAFVqrZg+Z3sEDO2Kq
	UwcYvMoO6LpL2JB4GvZO21SAJ72wNiOzuiLgYexT9GNw9dBe0OVU2C74
X-Gm-Gg: AYBFou1No2sWFTHEg2VVULNalR9HsVHApldsr5QAoRsQYC0P+0qczKUyIM7iUBEHisA
	JDg/lsVGpGiy5e5yA4vfAbJj/9cGKEx/MaSMsKgTB6eFqqUsuwZw0ykNb1GZoXaJryozAbotf/k
	a4a4kzo+wnD6EYLo1Eu6YvEZKcRJFv4Z5xR+aTaKWL3GrqS+i0LNM+G+iwt3LXft0v+m1JFXqk3
	B0TBcd+HlggCO6Z0AxZdMrkeqP+0jKzBW0n333N6jJcQSuj+s++hAbIHRESwLVODnpIp326uY4e
	OCKpVS0vW4/Tb5IrzanY1Qp5qFT59R8RiuerjEd6+JGez0LPvK11YPE7SjRorMKqkvcXoMG0Pal
	x1/ZSm786LfpwniMA8AZjOnAC0kvU3VXWIOJ8qjPzFuq6sBeY4s9c/gw7uChqudUl/OaLAbHlJA
	A+fzM5ll1bjEKbALRuPtokhq/M8Qn0abXgegkh6R2BR81XaaCSMLn2+kIlcM3hu2pa4spT56993
	ty66ijv+Ivk7n2NJh8oyrjO/768JMq1F1d6Dq/c8jw9Z5z6JtSDS2RKFYdF/8593rdPYASRCFhR
	A+BXl/Wn6rjZuqvhg5yblAz7XdGAv/Xs+GuVKWyV4HTABhZ/xC122pg36DCJsP5jGcfmMQoo7tg
	qZm8pNZRZa3iEud+mmoFvcPD/UiUZ5eLySdpUF3ApFEBxbijBGE0FObKfp4E/o8OfrDwvf5eVtS
	9DBEdTumcJjUO4Qw==
X-Received: by 2002:a17:90b:5648:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae89879b52mr8145082a91.65.1793608685557;
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm7861463a91.1.2026.11.02.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Mon,  2 Nov 2026 16:37:59 +0800
Message-ID: <20261102083759.1561867-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com> <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 31 Oct 2026 21:03:17 +0000, Wei-Lin Chang wrote:
>> +Minor problems are often fixed up by the maintainers when applying; if they
>> +say "no need to resend", don't.
>
> The second half of this is a little silly :P
> What about just:
>
> Minor problems are often fixed up by the maintainers when applying; ask
> if you are unsure whether to resend.

Agreed, that reads better.  I'll use your wording in v3.

Thanks,
Matthias
