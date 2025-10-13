Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375B2FE591
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351443; cv=none; b=cAPAXCQ9ECq2dUrU1VeBBzq96HSDRxfzj652y7kDqU/+Bv+LQn+2wZKLnulzHSpmW8vEUnuw7WiAqMIsFc6fAIf0qSpPx43IuLK/VdDAw0yOHATg5OpjY6zFbXkvy9cotuPqKP4Aqv9PJNbrcaH9bGqWZinXi8tWFGTw+sjcArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351443; c=relaxed/simple;
	bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXraWyhSUc/XGpubWhd7Z6ZI4BS/LiPaJFnHFN5PXqmpu1T8M8ReldL3YDXsjoRmJjkK8XXsJX/QktKGXrc5pVOycsAWXH1SogvA1A6OpYB/dIJ0/XNjYTmu8FTfbTVx7A0vHULTzieM5sHkvqbS0qntyZ0qwoCBHdrBn5UiJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI3Y+wNq; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI3Y+wNq"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b63117fb83dso143859a12.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760351441; x=1760956241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=jI3Y+wNqOfXqZkNirPIqMZYHa+OmAAWQsYhgvZlJScZ9FppHiMAO8uMcZ9717WT+xb
         ksqxuO6gkeSir3rTHYr7nEH2J0CTFzwK+2KDMAHjLSuwuOT4Uob+8Vh18imgit1tQUv9
         8Z9PQlJUpTGFbrfcaB60TppZw2994o5Q6qh+vYEZKYAVSabZzaiWNLONFDLhoAZK4of8
         wMgjGFk7ltREgkjq3YAvg/Fdo48Co77ASnp9/JrmkypzsUcmuRa2oeESd/uyfgvPWCi8
         CKoWM0/I0pT+6uSd096Bn0GqduRk+pcSJtmPKh0rdtuPMnhn2/w4BAy7HNBNmRsSMMuV
         LzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351441; x=1760956241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=fCRQkbbbLHl59WVx/P2+Rz5DM+jXLK5I6vDo+Yonf/UhXwMOVrxzpgKH+f9nI8l7N+
         kvbbFPoBIKG7wX5OJKL4FfsZxbaXvo5pUxbhHsEqiqQ2k3F1jsk+NH0L0iBoufVTvzm3
         clStpxQdU3Cbsk2sWwjCkGVrzqBc20lYN3XlPh5yJ7yZyOFAPqh4NGg4Ts6qYERvjk9n
         sJkoE8quUcAiO8eFYtjJwquzS98NQpKf6EGA3zhFe+f783SsHwNEM01NSxPiqLV802+a
         vfNlvzrfNSYB5FOOvPjnazuFHyIj0TRkksIy5UrPJnbgNVEv/CDV3TrItE7+TzhZ3KF1
         +UBg==
X-Forwarded-Encrypted: i=1; AJvYcCWyp5ZZAoXk3XQm+vlqzWUApw86tD+YO3HMitqkjwSrdz1ZPHNyWW01KoWJX0RGbLWpOhkY/L7fxYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlnSzkeGpJn6tkOHY3jSdggeXsZtNvtPrz3ZAWKBYPBww87yu
	g76M8I3Y7JERXGv8ZUz33+K81pi0yStcX2f0CTnJq2qEZAS3Z4dk/DRb
X-Gm-Gg: ASbGncv0eR0AjxdetIaYF/Ci0sKwEBvLdiXu5J2/AlPsyf3uCEInL0NiAYDlATFrBMJ
	4TeYbyeyQI+MbrzzvaaI1Z06nbMvp1JFpE9sjcyq1NfvZoh5hRrpFGDOWkCAQqFCOXsClrhFxwy
	AyOjP4elX0Y5EBCqVgIlvICcHtZCIKSed3Zh63uAwZICF7W4BANxGttuipI8+okHwou87wOGnyp
	frG6jLNThuMTZT7gUOsqJUQeLbm6ojoxeh5CG5Gd/EGwYFPV/K5U3modZxBX546mKNuaKgJcSPL
	x+feg+AzpWeNWNm4bK+qI7Zn94C1m3hdwmdMfqYn9i3x8BwcBxjLPcWzVOK6INr2kDlEbRBc9Rh
	/cRn8NvBEuQDwIuHlJdI3f03/B4SfGvKAcPXOPw==
X-Google-Smtp-Source: AGHT+IGzKbSk+xpeuhcRPxXprhrHKgWgl+TgyFJOpJO1QcWS3vLYIUxy1cm46/h9evTFKRIrqkRaaw==
X-Received: by 2002:a05:6a20:9383:b0:2b0:ff55:f838 with SMTP id adf61e73a8af0-32da83782b4mr14502989637.3.1760351441359;
        Mon, 13 Oct 2025 03:30:41 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d284bsm11467729a91.18.2025.10.13.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:30:40 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 13 Oct 2025 10:30:31 +0000
Message-ID: <20251013103037.44979-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
References: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Oct 2025 11:45:39 +0200 Alice Ryhl <aliceryhl@google.com> wrote:
>When posting a new version, you should start a new thread.

>Alice

Thanks, Alice, for the reminder.
I’ll post v3 as a new thread.

Thanks,
Ben Guo
