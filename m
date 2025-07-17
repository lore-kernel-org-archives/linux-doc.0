Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BC9204F93
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777668; cv=none; b=LdFM+wcf3wj/rV7vSGdYQo7kjdEExjdHd53i9TR7tS0PhQemVHmwsiIssKXgVx4OR7l6T5Us7qOIM4olK1E1A2ivS80VcBqHyvDQFIz8ETojN4bBG/IMsWcMFpEwX0wwZPuOJYqRSctE7TjxypA7DD+ySqaNBbNPr6mgkTYwnoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777668; c=relaxed/simple;
	bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=D8RzeF3eWQVB4lCP7hu9ApLoJNv2WK3zcVi0OWxwAR8vD/TgiGPWVRKHGqEqUT6Ukh13nyvkqCW6o1zWE11RbxRHNmaryuxDwErc6KylocuVUsaiRuT26HXhavWEn5yg5mb+D+AG+7g5BnwuT15CgE7E4+UwNEU/nsX21OAuaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Yl5g2Jxy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Yl5g2Jxy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-749068b9b63so1017143b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752777664; x=1753382464; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
        b=Yl5g2Jxy6PDfkL6/DK0P+X78cH6PGX0yaEw8BqxQjdoqwrCR87XhhFZyww8GKAE+Ir
         I3nteefRMyIz6YMADle63WuNMPHA+/y4B+zLN7w18FTUraxfor9e6ivhHUPuOgFg67NB
         IXVJLESKxC1d5yHUl1X5BQyk0ramA2S/q3+5mMo2fucQ+h+I1MHEkKOAj2k4nrP1x/Xf
         /Nns0dDIOnP+7xXdKedXeh24dNlbUy4W3UpmIvq/xV/kUf+u+GgKz1PQGoRS82pseEHF
         Lv4ocx1UKUZbMNjhOQ8TSOmo6tuYUGf1G8ISXk4opalhTesSBT4DFcIUkqgMZRIQUWE1
         8/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777664; x=1753382464;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
        b=rWlPk3IhW53guxLsIRdeQPB5uHKPFZaDIH2ettUpF2zlJhFP76BG01tUaR/u9dlChC
         QaX6OwZtM4FjwGavuwaesXYNUTsAciiM78RCIjs5XsZFLGm57YcuGVTtF4agrcwaBQ6e
         UWlednpu5kT6+zCbq9maLZ/S02GQAT/ohEwnniYKIaXO0mNMqsRnTg7jtHdc+CwghRow
         PWYcWNjGy7H8OmObL8WZvL8eSKO1XmzI/l0ge6E61/8qyCq0F02KTO+c1cMXH//4lZLV
         qRxR7ziKjB3BSWjGpZ2rKTf0nn6Ce5YadpVviIiPkEFemFLK/bNQGbWH8odqBwaPVwt4
         DJbw==
X-Forwarded-Encrypted: i=1; AJvYcCVJG3sJMo/aHUku9Pz4YZpPGz35O7dJnh4EZoN6AneNEo5/PAcXqFjRjhP8/MpuvFatfzJOwG4zJEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3f5P1VkjioxTGobls0sx5jjN9UGQjLcKN7PeLbJIhmqDl95WW
	G5GUhPKEM+ZaMSpGcKAHcmvjrwDSxkXFsZz4GoYH7o/emP3WQU8jjHL8pzk+lu64vWg=
X-Gm-Gg: ASbGncvrZE9IYPlLtuK4ZhyNcXHzEwD3jRK0rbPN7KUbFiY/z5nN4vv4LZU8ibYvIwC
	3n/y4d7ENKOWJ8zyUJ9E9STtzDDPM9ySTMQP7yCflyoCEQVmxkYVsvFtqEAhQL0fxtk4+5Ui8aW
	B2KWMObBBnyfOzyPMbN2kjPLlMBPvFXWT4mIlMzcrxIihyK2VrrMoeZUWfjZjNKY76uWP5hQvwx
	CStlOFm9GPy76wMeorPKrcIAPLOE6iTe4jmD7M7+NZB3xJQtPTWN3NH5aUnZRUUtQPL0SLjEdn9
	UEj6HhsmIwHkU7R0VAolGslSRxv4wI7aqs7PWcqaZb6vYhB/MvKrRjaVjABIj4wpXuuEJ9p0Jjo
	dV+4s6S0pzoTbNINYda0=
X-Google-Smtp-Source: AGHT+IGJSiqVRqEqNHtQKOugHVGaBNjYMDOrySpKjtT1rTqdZu4A+8+NkiaILNEtNNDxpHEp7TmBLA==
X-Received: by 2002:a05:6a00:814:b0:748:f3b0:4db6 with SMTP id d2e1a72fcca58-756e99fafffmr13108030b3a.11.1752777664328;
        Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06890sm16623945b3a.48.2025.07.17.11.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 11:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 12:41:02 -0600
Message-Id: <DBEJTQ0J7H88.5X7XSNC712Z1@brighamcampbell.com>
Subject: Re: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI
 support macros
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <dianders@chromium.org>,
 <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>

Woops. When I copied over the subject from the previous cover letter, I
accidentally overwrote v4 with v3. I'll issue a v5 if that's a problem.

My bad,
Brigham
