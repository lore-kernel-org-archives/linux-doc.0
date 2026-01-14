Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014A36BCCF
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370728; cv=none; b=qv1kHzG+FsVNTcue5U9aejnYjhQtv4rEG9cG3FMb1ITb0d/hXaHb2lx24TKgcLHd6tY3g0idF7qHaOo2uYHBc7yu5VewBL42uTm5DvpnlEJiC7KerupNrbDBzm7u4EIumo13LtwzUqRku2FRmSr0tMMGTpW18A8oUhgDGNGITqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370728; c=relaxed/simple;
	bh=UuOoBajVj0wkg0g4yo/s1ny3PHf3Yl5+HedHG//0BQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAY9H1OncbwkPYi77MoG8w6Bvu9K2b36v7UVugBrOVzAd6osH5Bi2gN5csxN3Kq3ggOCfZFrxJ0mot9UKieR128vyctXzjsyGXczm3Hyf1II5RgHqI9M4KlSKmsShQsUOsIk4DYjwrFYWIYsr4s1hqOIRzDvC7R7N+AL0dui58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky4WE6V+; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky4WE6V+"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-11f1fb91996so78537c88.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 22:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768370718; x=1768975518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuOoBajVj0wkg0g4yo/s1ny3PHf3Yl5+HedHG//0BQQ=;
        b=ky4WE6V+Q/0NbmNkS8bmd9Tb7TyHOka9DAYHvuE7uuU1YPkzsj+st5lHIW6LPlK5zp
         KZUd40QP58RcTHzT59kr2cKL6dkXWhqHQWQwLFn5U317uSKCiMiCZV+OgtrU0IDLz7WC
         JyMf6GCzGFHuxajIekqEaTIhLCEb/jAFjphrTsZbXXX46Rott3eEzT8gtzmywu86xfeb
         3v+q5z/dUYj9c9ZTdHxTh9K7UhKQmIrmfuQPpwRkV6ooolIWLjzZTmlmHqRntIeYaWYe
         rhWUdHcgw1b8ncg9a+TT6l048pN1IFW3OjVhIeMpAQgP1qtUMg/CFUKDYDAaZluZ4mX9
         oq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370718; x=1768975518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UuOoBajVj0wkg0g4yo/s1ny3PHf3Yl5+HedHG//0BQQ=;
        b=aACKUBCzC2NJz1Z0nHmI1uybvXVENwfpZDoWU3ndS3hRqeERQyxrQoiQd93jJf2udJ
         Bui+/qEiHke5xOQwE6bfPZnC90t3IimnBzIHl+nZVn2CLfJQapDoWIuc0mik9xPlyELJ
         KYUkZPZyuMuv+3tYvYJ9Gt1acTnKQKwUbWmOGxuLGjTXYuIwPPRI8VOkNHvil43DZ2G0
         +rTUkhkRgeOrtl+Sl9RJnN70Vy4PdHIwBKP16MENA3ABdBWETL6GooRTlZ7o1H0x5OAW
         eeQjpOnczrxnr7u3qWGbDTffBc1te0xVwXQEESZK+wL9KdI1g85ighPScZciVVBHo7wu
         d7qw==
X-Forwarded-Encrypted: i=1; AJvYcCVSjMWdUPi4hEVk52WSuorzkGFOCe+rxHZ87rD8FaiTTN9/tYXaaz1zrvU41eyrIw8TFgzV4tpfqWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPB2vtqwePWJRD6jIck4+UBvPVOEaaqFJeR2k7lIxlYHgXIYyM
	1nIyZEPPflLoA0DBuqvFiywrZ7uqQP7tcyE0RLeCfWWSIzdewY9vzcX0
X-Gm-Gg: AY/fxX4pYnkJ/DqfvfHJqP9PZrYtWjZbVopofnigxktpHskoVIN7XrUAO2Pc7OZT3rZ
	hfqvnGC9J+Go8q8cK+N6wU9Pt9SaKRccPJ7wP6bKlGyjPr1Y79tU+V0C18+CAOZAdr/coLeEJLN
	ow4rxcWSzZH6mqD46Q734ew6GYGpgFjbAOIJmipIMNG9t1E0QmvcZK1ztRE2LUD+ZII/hpN+ebW
	WzaiT0hULF4XbwQoCmYUr2IV8uRMbbV/6HGpQvm2YkxafaZCfS8+dU7ByzgBPK86VfYdEwhDi2n
	i3PkY0avEl3JZbOlTWOlZAeKAzsFzzFd5cnqCUAxGBoYWfcGTAgLdJOLoJo0SI1T34L9VrJRJIF
	Fr69XONeB3+i/0dHEuRZwaUCxZEFev4TihqwcVi6vChC3rHn6OJSqHbfPHcf8ajlYs/4Ek4LsWF
	Be
X-Received: by 2002:a05:7023:906:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-12336a47f3cmr1905143c88.6.1768370718015;
        Tue, 13 Jan 2026 22:05:18 -0800 (PST)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c239sm24911154c88.9.2026.01.13.22.05.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 22:05:17 -0800 (PST)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH 09/11] Docs/admin-guide/mm/damon/lru_sort: document active_mem_bp parameter
Date: Wed, 14 Jan 2026 14:05:04 +0800
Message-ID: <20260114060504.87119-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152717.70459-10-sj@kernel.org>
References: <20260113152717.70459-10-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Document a newly added DAMON_LRU_SORT parameter for doing auto-tuning
> aiming an active to inactive memory size ratio.

> Signed-off-by: SeongJae Park <sj@kernel.org>

Acked-by: wang lian <lianux.mm@gmail.com>
--
Best Regards,
wang lian
