Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4537F8A1
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439891; cv=none; b=cRylZbDB28enJ53ouF7m3oe8N7eJaRjUtUx1zw7uvU6Uo/HL1/1WzoadNsFxxVMq5i9Vn+aDCeB8I1ZcUaKSQXRuL0MgmrxHIHzWnndXw9A4HPtKEV112K9EsOi2owuEu+zhal6TdWxiTh13ttvKeBkqSQ7qwQDeC9t+6OM+AL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439891; c=relaxed/simple;
	bh=EkT39f1KIDBhTZ2OrBhwVy8sNmI5bUP3tSeQsoYP6LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHV9W0rAXUNbYgsTOfiaWeq1sfihdOFr52HNxSHac8aUpFoiX14iz+h97cyqzroUexBCz2R+18ema952pJh8lDXcLaqLWtcWTHWwhC0ExgInyZplRBFeOLzg5lOyq/QNzPjMls2YCybGqbMxgTTlBFQJ56UkBGRBMRND2N6TDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWdTo1zc; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWdTo1zc"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf2dd01d2so172216a12.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439886; x=1791044686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+QT6o/elF1xDGOeSd2f7diKca9Uc9+LqF1etILsUHk=;
        b=dWdTo1zc2DPW4hSZywq6DFmMa9GGS4JlPUad9O6yrhvOVQg4DoYGDgQCaZtlVjUK+e
         OAxN1YTpEJch9vQdBxG69gwe7FJhTZV8xnWQZVgtc7Gkn+Tyuq9cI0VzomVqlsslncRD
         UKyZ29ssOIDQH4KcCEXb4YOF481dYc/r9E8SX494fnByWaF+LFU9oQF4oXNqHT7KZ6wg
         i26iGl9U6fZuX8lMuH1Uvi1Ir4SgwWYqmg/Xsdyj1B2iigLeQ/Vs6ibEcU2RI1M0Y/G3
         J9THID66FMQmCNs0DEyBAxGd7QdvZ32oDl76FE+TVYUs4TbAZV5GidUxbKzULmV/Epjy
         71vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439886; x=1791044686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+QT6o/elF1xDGOeSd2f7diKca9Uc9+LqF1etILsUHk=;
        b=NK85ywY1XsR0fCgSJ7zOFA8RH29JVUTydyU2UQMc9d5YOQZ5qUhfkwq/HYzwwBO8L7
         dbZi5Ge2Eu5nI/OUV2TYpVB5zVUaRCXn1O5/q+lwu4VRXZ3mfz01+BoQn098go3oi6PC
         /PP17Lkfnb92CQGU50paK04feBMSJXpmNpist781b5v6ts4BbvoPimGCxN4u0ijLJOru
         DWgSmcAPCdg8C15UUaATkcqGzDdxpmXQk6/E+AabLv8okLilzrLVqEYEWRzZyHbpHIbX
         FbocjfAo9yWmDOcvHWxkxhWQBfd/7PEbDMmmJrUblASGo4lidJAys7j+w8WM+okTs/YI
         a5/A==
X-Forwarded-Encrypted: i=1; AKwUvByX5bP2Ab2F3QPphWPFqc3vavVrcVUTm2OHVSFJPFodSTroWhtQPr3mmrTkTJEDHledyLDEFS6FMm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPVw7LHDVLC6BS9HzAJYr27dDrHSGXXjPT4y992JhtLK08hYtO
	2cB9fW/LmZkbiIw8EeCoRzx0ZDyURQ+7Iraf/FlTUDB1PMCvVYxr681D
X-Gm-Gg: AYBFou1hYB03ZR1p0UKINQtr/5RIHesFXcA91gUghMmuQyHHzoK0V8joOh60Rnfy6cd
	/qcvjJ0YHP2OafjdriPsN2BdC0hOLrPzQLSnurhuLbdPs2P/q0JF34i32DNWhmYhE6d6R9jKsYg
	OLxQPqRc9PWkH3dR0jshKYpOGFi0K9NnySrEL2ohbmSemrKZycAn2V/KOypMdP3MAn2Jfy1Gvsf
	ihYM4IcvCXe6rYCK42PhyfRrpEY22VdBNHVTAb4CD/iquHBbxp9KEln/Qg31/al+79JSF+ftdcp
	XBQ18iWxxGBsHAChRfDGK8NUDxl1lr/mO6xEsleiHWlnH2yMAS+gE7useCZ5f5ZRXLeeuDPngPg
	3H9szhPt9dZuL9ptyA48cxDhaOpjJqBiQnwzGZC3EHDlZxX7Ss4peoGqj2KTrw8yiCHQSwKsJXa
	krJ/d96c9LSuRXZuui4RTi6LR9NH8v253CB5xOBattwYuwjCFYIKufjGXmkG3zMNsbUdOVMLO3s
	6IwutC1aESEuXjuFJU=
X-Received: by 2002:aa7:da50:0:b0:6aa:f1d2:ddb4 with SMTP id 4fb4d7f45d1cf-6aaf1d2e038mr2950090a12.3.1790439886100;
        Sat, 26 Sep 2026 09:24:46 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.3.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ab5be678b0sm572665a12.36.2026.09.26.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:24:45 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bvanassche@acm.org,
	peterz@infradead.org,
	elver@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct declaration
Date: Sat, 26 Sep 2026 17:24:28 +0100
Message-ID: <20260926162428.11127-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87o6dk3uwy.fsf@trenco.lwn.net>
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org> <20260926095405.56438-1-emmaonana18@gmail.com> <87o6dk3uwy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jon,

On 9/26/26 9:16 AM, Jonathan Corbet wrote:
> Omokefe, I have to ask: did you write this patch yourself, or was there
> LLM assistance as well?  In the latter case, it needs an Assisted-by
> tag.

Yes, I did write this patch myself 
I have also added Assisted-by tag to my first patch V2: https://lore.kernel.org/all/20260916214357.22573-1-emmaonana18@gmail.com,
as you requested.

Thank you for taking the time and for being open to 
the tool-side approach.

Thanks,

Omokefe
