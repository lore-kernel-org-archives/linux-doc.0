Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728675;
	b=uHA69CI5wjLnv/FAAeIbXE7PIA8FerH4ZHSxReYk0E38seGzdHgMuv1XYxxWSCJgV3i8
	 MLxSI7MdxUByRAiQkOnIEyizEi+as7HPCatyj/obAMsd3n4rkdIWabM94rW1frcVZfMEJ
	 j5zcIDrnx9jiwTrjhL38odzun3vhAk1yLcoe1UxiQDct1K9eKtmtKKtm/4PsXgVL+hwwl
	 PMNwX79SnV6ItvR9LMAiqAZju+GW5bQ0nazpnnRW5MEEA2cQI3blulMK1wbq8+amUI2Ov
	 Pad/jsHDMH5lEI16Sz/o+3Dbm9mwndt34nm2EXecpwS4QgAVRvqGDSN4sNb1u50Ds9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Content-Type:Mime-Version:Subject:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
	b=vYT2I2gS2Piow4u9tOr0+GYab7EOUOLUmp0CXnnA4nQ33BU8Zo16inBMInWrLM5aGcha
	 Kj6rMPm+0PD07QHPT2Sgo+8Mv1n/60ZU3f3WQ5jlrhMbSA2+WFNzpwPymHktOuit0YPwV
	 tGwiClkWs95flQkyohAoDiQru2EA4lJFbpUXWfw2DVsGMbQ8TsD4YkzUJLxYV9z21Rjf6
	 cCsfovKP/7cQYEEqEcJfB3+iStATaHv5Nyv9EA6CA8DrLpe3a2rcqa709Zcr5h5gGpSV7
	 cGn+NnK21YSF+ICxPDeOftmA/+GcYU7FkiUR45+GBW2ei0p/Jp+3LbT+AF9NYAyGrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjtWqbY6;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24B606A330
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 17:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F24B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjtWqbY6
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so6516584a12.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728674; x=1794333474; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
        b=cjtWqbY65Y+iH0vqgkNLVug1GFzj3TX0gT7jH0epqHI9kDWRFlLHgr6kPgPQPmZru7
         QJQbLzcYLwYhQmz9a7Hg+QQtQXq3fdoOvmdePefUk5PxZs3Dg0GuzvKmpFWUTgSsde9m
         pbEjN+yejVAQz9/tRmJH67kU7Bx1Gd91QHYqTXCOge5KW/cBIEpSEhcJNWX7ndLSMTHF
         7/Nk+4SwtYAy29HKcAii25DzO7aduSeFGfsy+2XxUh6JdKwSSbqLqyzm4amhR6IQ3pze
         7Jj9uGJ7KM2m9sd5irxZvhNh7RgoLUzjjlCvyPRxJOhgYIBRLcVb7wCpxuulFlhq8Tug
         cwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728674; x=1794333474;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
        b=jFltr7omEDXepPa698zMc65ITK22NHUYtuwMf7B5jpwBRozGMd30T0pP3d/YcWSGCo
         BGQgQNhTo6g52UjC831wBV9TPAvIKgEHq4aFc0vnjsMokirWKRzvZngkZeXHoxdCIO18
         SOEsONkujc6urG38boDfFNs59dcms3hrJthDJ7JN5a7/tWNyGh+lBvK6DTBWuMXTVckA
         VBmRYqG/9eKoRYXkdyOtCWc96uPBcKcCafYwe9dxlrHbi4JJoycuTLVtGGV6VtDgAvWS
         yWcIPUQ7IDpkzsZD9POea1ShxiFwLUhu++hVt/9Rqw0Yazfe7t5CQC8ekmHGF4xTsrpv
         k88Q==
X-Forwarded-Encrypted: i=1; AKwUvByDEFnNBCa/lh4kjhnIQMXRGTF1h/V8kHi+ZGR5A3T0+PzMRjiflnO5bG315DFw7w0h8NZl9SNwTJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PnXWyOfR8tP+g/3ITph4nBMTsXdBGst92SICvyuzsRAtKfiDK
	t/dhlkILsE0eGo1TUziRI+QVdSIk4n12yrLTsOD+vVCNOmNbRpr2Q+Ny
X-Gm-Gg: AYBFou083sYN227+l6ZFn4V2ghD6rOSajAI8Q1Y77UijaOjrO7iJzMepph5puHuHEFW
	w3Z3xaqaJYsFFYpuhEvbKCicR7a6YaPRK1A40i52w0oG6XqiZnssc3HiUsTKNFfRFXK4JUXzF7Z
	q4mzc/DA40bRSm8oChES+iXq2wsezlE8sf6iWr1ca7jRwrPtv+7PQa17M9UBRrbZi6CX7vR2zYh
	IhSOHW6VeBz2OmsEhf+wWHrrYvb714lZIVpc2gFSI0hh5UMFCCX50ll/J2M6YkQDUAteP4cy9/S
	11/V6w75FhqUGiKMIi5ZrQN+2udyvf+8PzNd0AjuW8rJEgl6UvJ5U+4CQN5v0JIAUZUtC6LP7CE
	of8JE6rnbPdqtEAeTg6vT7qDsvOCDShOZNFEANIsHx2pCPdWLI8ehCp56n1n9oju1KppNDqN4Zf
	iomj9m2TAtxL/CFAh4uqG7b3B1LCQKLnjXG+tlfGtdyZQiBM7Tw9MO2xUJhpXqgPvg7rJhn/oAE
	dKDflNtfdx8GZu8FOH6TY46h/THI/C5mjrv0mSjimgAQ2FqewjD41t2rupFnTHuRuDfkk8ON635
	i3fbGTPFpz6UEpCcBm3oD4LKl8Z83lf0g/nWp3BwyXkDLmn2LZ11oMaEiVqHswp8bPUiFjNM0xZ
	IeeqSIaWAs82ImQfr1RPBDPx4tlZUpwsY3N42DEd1pXGBsZyO
X-Received: by 2002:aa7:d888:0:b0:6b4:201f:17e3 with SMTP id 4fb4d7f45d1cf-6b4d46766ccmr6791930a12.16.1793728673607;
        Tue, 03 Nov 2026 09:57:53 -0800 (PST)
Received: from smtpclient.apple (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb26sm4301629a12.9.2026.11.03.09.57.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:57:52 -0800 (PST)
From: mixalhs <mike.michalo@gmail.com>
X-Google-Original-From: mixalhs <Mike.michalo@gmail.com>
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 2/2] ksmbd: add AES-GMAC signing support
In-Reply-To: <20261103171742.18816-1-icb@fastmail.org>
Date: Tue, 3 Nov 2026 18:57:41 +0100
Cc: linkinjeon@kernel.org,
 senozhatsky@chromium.org,
 tom@talpey.com,
 chenxiaosong@chenxiaosong.com,
 ematsumiya@suse.de,
 linux-cifs@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
References: <20261103111453.84804-1-mike.michalo@gmail.com>
 <20261103111453.84804-3-mike.michalo@gmail.com>
 <20261103171742.18816-1-icb@fastmail.org>
To: Ian Bridges <icb@fastmail.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi Ian,
Thank you for the careful analysis and the reproducer.=20

You=E2=80=99re right: in the multichannel branch of smb2_sess_setup() =
the binding=20
request is never verified with Session.SigningKey, and with AES-GMAC t
hat turns the existing signing oracle into nonce reuse.
Namjae, please don=E2=80=99t apply this version. I was unaware of this.
I=E2=80=99ll send a v2 that first verifies binding requests with the =
session signing=20
key before they are processed or any response is signed with it, and=20
check whether legitimate binding can also reuse a nonce under=20
the session key.
Thanks,

Michalis

