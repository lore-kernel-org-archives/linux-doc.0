Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18431F98B
	for <linux-doc@vger.kernel.org>; Sat,  4 Apr 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286789; cv=pass; b=PHlGpc4y59bzbhFvgKOmLnGXmSukeCeHxQTXZMKOw0ZvjFkl9hxZpLyrZrqnnBLxcjgJS8BuPK66XW2oEXMdM8F31Ub3mIo9KscK6pz6GIpok0p/BzHMKl6KAaIsiKfvw2qeXRzZXbfTKRRa7EE5knSSsyQRXMIyIPbna12yysQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286789; c=relaxed/simple;
	bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPJeP/jMl0IO4mJCvGi3W8bIHjyJhGhD/1MHHMWx52atGHpMqrpvo/bYsuvTYR9myO8azeUckml7ynE8MrmYT/1u5OvPCWjPzTf0KdvDskZdzJzKAwz1cCtu8guF4+sfUkQ+qP3Yb4EYjuXFHJKWIA3vlMISuFSXrHfM7Or8YI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRYEruK8; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRYEruK8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab39b111b9so10642705ad.1
        for <linux-doc@vger.kernel.org>; Sat, 04 Apr 2026 00:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775286787; cv=none;
        d=google.com; s=arc-20240605;
        b=cVsjx/GJmI7kqa28uc4OvES6d3lsyYl0lMn4QwmrIqR1bQWyb1B1n3loQO5l5c5iu9
         umoXlEEBNLvqtlnjX1SviL/UkQQ2/g96Du5pS5U0CoNG2ou9SWII0j5cSgipvqTd7d8/
         evggBGA7kf5gSyII2dC2Nga1GO8EAEK89qiHBRVwJcVINKJjMs3z68njGYvFuaAJZYT8
         mbbzamJNjsC8LPQc2She5lKmhEZhYTC4hro4y9kQBEHV4ztPEImTFk1KlAbEOscmPEJM
         i9lGGDk+sZkqhSmXXc1SMWbMUBr0XJW61smUhyVA1O8HbtI26LsH58cmg/r21DT+wR8T
         7OgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        fh=k0CdLF8RV32Sr8DNNQqUIHSpBmbocyQI7pggtI28Qb8=;
        b=DgYWsIVSAKN7IOZYdjFnTwG9hxKtqu7c3ANavqFpudACjZverFLxrAdlP5+0mdzmHD
         /kwfsX4PGzm9bvc5UgCgwSKJOtepvr8V7OAdU0AMA44GkOauTrifDDpmGwAsPpGVv99p
         SQOlKtds+mn2vK802zOIyfFiimroWbz96mJ4mcioJmRenv1IJhkNEdX6+8o/SWFaC++P
         eyW2WF8wkrKjC8HEthx5x7m9hP8yqBW+OV6X517IdFeQ5JElpyMfab7GPPmcfdkd9KKc
         rNLED23SUAv+XY9KkakiIbw+o2P1UiboYZnYogHTuJ18G7AVNW8qr32pma0ORrnlyhzN
         3R+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775286787; x=1775891587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        b=RRYEruK80Mn9UPdtb6fLobaLtc7P6xudOldijCLt9ypGQ/toF01tHKnM8YPrLvYjbr
         LJe8/Lca05vEfcOon+pGEaEM/RxBnOBVc9fkIksJExuJ0GuAJQze/68FKvhiCTosujB9
         Eo9rKZo5puvE35pVC9ij32mpqPb/lZSaOWCHTVs+iNzPfa3o6AiOvlBDcn+LvTuZspKq
         UlyI0cNfwY0h21OktprQqQVHBaoDquBQcM0UjFA3Wk97mABRhS/fCVT0iAt5amElgkD8
         yqEtOZUrBEkNxm7NA1L73QXDnACCa6GTWt0d/3lsE0Y8FeCkfExE3Wwe6mka8k+7BLju
         se4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775286787; x=1775891587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        b=Hw50YfOed25ZpAQ1s6RLh8bZdPDnRm/THG+IeF6Gpr8NwDZekjfVP92VCW1qQa31eV
         FiqJ5zbm7t/9larvHFQJExDTrEoeWRCNH9YDjTbkGE3hggSaPdv5lN+/9aCqLAQnrRBf
         jgl6RDRUz0mE6lZHjZBLSdJCqWuC4Nf55Ab3WMFc1+JrG0+xUyysBLWEO4tCBuDs1+mb
         tKhsnd9Vf5MX+VDP0ZqtrYtedoGKP/gZWM9OGXSHLH/aZpaDjZGAinr+tbRQ1yJFH5Dh
         GUkiUJyZumWeHywX6MLrSEOxTIn/OH5h+E23OhPoqDdsYG6gjqOHDfdUKUZpzoZdzLf5
         +SVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZYB9oXanc4/VNEaXP/VM5InJ6NCpVOZ8YZ4Hixdsmc93dPHDYGLMuBSLcnAg2g6MMrDp6iaWrQGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJb6U9ZR8FKXPpCA2PmDWDzK+pld4bz0zGc3BlTdOO/vhleZM
	0wXvdOYxNxlAzOxoz0Q8bQ1gjolFlqZ8lGFgqf33CQcEnjo1bQVqPPQNNjijM7GXYe6RArGjsqt
	cFjT4YWpIiyMDYB6fmQG8lZ+FDOLaCh321OQv
X-Gm-Gg: AeBDiet2tELyrMBjaPP6ygD8IHXWjNT+neQJSQJkBpcY2qbSPuPtBPWRJEHwQJ5lrGX
	7DwsVPtBd8RItgE4lkPxuGv2bIW/nwScWY3dqpQNaXk9i9HoDxJ4mQ2WKJIpCeD2UhvY+Okb/bM
	zLt+szUBvoqeoE53ZxP0gM8rl/g6PkWSapVztEEIHKRCnZq+iMkvMv7GPg8Zozl/DrDl1iYeXyo
	b5/1SWejsp4RwpKnzQ2LGststoJ/Y20fsDOuyIsD9KMl4GETrAuzyW/FQ8sRjbeG0L+9319l+EI
	s0Slyregz3voK2J5J5jWYoV32m6rkYXxpodqyUcQ
X-Received: by 2002:a17:903:1b2e:b0:2b0:70c8:ccea with SMTP id
 d9443c01a7336-2b2816a64b9mr56570735ad.13.1775286787272; Sat, 04 Apr 2026
 00:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com> <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
In-Reply-To: <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 4 Apr 2026 09:12:55 +0200
X-Gm-Features: AQROBzCHZ35tCtoDo8m50DlgqUT0ZTlGMZCktkN4oemYuJIdiiyVf3JJGbg2n5o
Message-ID: <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Veronika Kossmann <nanodesuu@gmail.com>, Veronika Kossmann <desu.git@rxtx.cx>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Apr 2026 at 06:38, Guenter Roeck <linux@roeck-us.net> wrote:
> Sashiko has a problem with this patch:

I must admit now, that these _SET macros were a bad idea, it turned
out to be too easy to misread. I'm going to remove them.

Veronika, could you, please, show us the output from sensors with this
version of the code?

Cheers,
Eugene
