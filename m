Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1A3655DB
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984200; cv=none; b=YpZ+ywwUSBBMPSEKHLPbGO0DYP5c9ETqyxA/Nl2+bCmcOKpcbXbj0V9RfGnWScX5fvQOb5M2mT7Ge+T+g3/g13xj9Viy4ESJX+lyVxOcgdK34n/Svo889PLZq5FLU/NYgBS7ZravaCfRxb8Ix5fnAfKK7uXmsMWAe/ihaPurocQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984200; c=relaxed/simple;
	bh=L1nPvS1jtCsUYWUIj7lHErWq2xpX3+/TQ8IQpC0bH0I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=kcz1JGR/Kdlmx5NsKwtGoY1N0q7Kh1NP6yJl3sA0f36NESiH04ajzOo9YkAzK0jVuCdzJQrA70/Sly0xMVFUKz+iGr7dPPk5mbQKk6uTRP+jGNe1NSdTvMu593neJZWa3nlBF5ozX7OXkTYpriq/0UKE4a4Ac69WqV+QLxQeH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=EFkcNbSW; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="EFkcNbSW"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13721dfd471so6623776c88.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 22:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1780984199; x=1781588999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1nPvS1jtCsUYWUIj7lHErWq2xpX3+/TQ8IQpC0bH0I=;
        b=EFkcNbSW+xsn0MaxTRI7eCQ32eD9q1oOxV53bYBvRWHfy4XnPylcFF54W2EzdiEumL
         Fdh21sPI/FKdJLSlKbCsC0ir12zBNgyghz09IEbecirFNpuYswdeK1yy0kBP6eBzCmsg
         M909Zn7xom9KXcwvJ/zabe2MMymOApMz2SV0/z8fbRYi5K0jC8ZP+gioKwEA8aoBTxzm
         Iv249LiQx9MqW1AvBmRMX5E9yMGS5BfQh67hRrUeGauHaPV0cZmYjYBMv48Y4855VDur
         1CWz185Ldjv3pnlCBKlXJsBA90iJO1rLmRdBFaP+GG6p0jOaxozrVQXDVCstB1i6ZHJZ
         88kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984199; x=1781588999;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1nPvS1jtCsUYWUIj7lHErWq2xpX3+/TQ8IQpC0bH0I=;
        b=FYyCM5iGP1HBbUvsYmQx0L82NeYfN9b0EbsKTiwxPKQQPMRQbjSEYUwWd5mae2DUG3
         hAgVtVmZ0NY6woN+x3RDbS0QcuGHWC3VFNVfQmAo7g+JHYnLsVWEq18AUwkiLXK7hQE5
         scUTLOSRM8CyZYAPZWIdIUYOBE72aWauqHUIfUCGGY2pNjrwRuIol+esJGBr+QgagSkl
         lpw84/J4qZm4+FrDy4mg0Mu3qHAfzaf2AwEj0wBgtvA2HTcP9RusNc5U+vf3SpdihlLQ
         SMaYRWXaQ1lwTF7alP7A0L8kwA8yJGTdv5Lw7c2hi36X7w+y2pgOcYYeDBF8gw07sWuD
         +bsg==
X-Forwarded-Encrypted: i=1; AFNElJ9vbphr5o9SpWcv0VDs9xbjeaaiUQ9IO6O5dn9qJbxtOOI6aQfa/oCZ7vublaerzL/1l/97XWNgu7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HaPgA3BIvVOaFpDAc0t0k/G92qNk6lN6R3bLqj3A4d52Nhbh
	aVgA/MIkEvgHRIu9TPDfmhKfsVgfAWxKPVURE4h4+kLHALVB6z8inSQ5+PmaWmE1pyk=
X-Gm-Gg: Acq92OH90xC5UmqfqAQEMP4iMPs+hEPyImqMYXkuc4ubm1k7OuWedA+YPX1Px5Lz+fg
	8Fm5zYu6RpNwsX6Aad264DQ7JQRgPyYYe1QyQtaYOOkcc3IFK7GOt6DuHVQ1jYuYDnYNIrZno3O
	bVLBc0ehLcHvglvbXWU8V5i5cetvg8jpeXlG8VFKYCi5DMGWuZbXqAASvaYUUrlkHCtz28qgAuR
	oeVyXyoW1uhfHXG5Nd738KQySj+U9NzE0BX8rYwIkdv9RI87hhy32KHcdxCEhX0hzXXIsbp/4e5
	aZX0vn7OOxKsRour1VPYBo10kv7E8Jsilr4CKgLwKqp4y1UF6XfPdJRVREom0cAy6TDhVVycelk
	hpEIBt9AE4gnBtVjKZ/lw63+KP7rr3Mu1dOcZqYXeyZoJErZCKEyFUNIkeT/BmVc7I5j8s8MGZZ
	IsH/qJdH6/y/3yAgJatCQo6tGrBjeBVln3LiLhhwYc+12Jnm3NCjDc3qtFSxaWncaK+W01QCCdZ
	6UreZA=
X-Received: by 2002:a05:7300:7488:b0:304:ab8:f89a with SMTP id 5a478bee46e88-3077af30955mr11410928eec.1.1780984198780;
        Mon, 08 Jun 2026 22:49:58 -0700 (PDT)
Received: from brighamcampbell.com ([2605:fb40:0:c09:9ca9:e0fd:b7cd:be76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm19832875eec.19.2026.06.08.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 23:50:45 -0600
Message-Id: <DJ4A839X388E.376Q6KVB6JE14@brighamcampbell.com>
Subject: Re: [PATCH 1/1] docs: Fix minor grammatical error
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Brigham Campbell"
 <me@brighamcampbell.com>, "Thorsten Leemhuis" <linux@leemhuis.info>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION REPORTING ISSUES"
 <linux-doc@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260605053826.7836-1-me@brighamcampbell.com>
 <4c9b2927-29e0-40a6-bed4-14142dedd2ef@infradead.org>
In-Reply-To: <4c9b2927-29e0-40a6-bed4-14142dedd2ef@infradead.org>

On Sat Jun 6, 2026 at 1:10 PM MDT, Randy Dunlap wrote:
> Can't you just modify the first line only and leave the other 3 changed l=
ines
> intact?

I'm not as familiar with the kernel documentation project as I am with
the code itself. I figured that it's generally preferred to maintain
80-character hard wrapping consistently across all documentation. Is it
actually preferable to _not_ reflow text after editing in order to avoid
munging the git history?

Thanks for your time, Randy,
Brigham
