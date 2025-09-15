Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDF341AA3
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948827; cv=none; b=OzXqSc3pHzAqyOcY+311Chg7g4PqZydBwP6wsa2tDEonC3tdLoxxLLiWwj2WuZ2yYx8ioaoAAiG8S/ppLtL3kWOlf+cJCbDNhj5TiAI2QI6pLkHc94ltqGi7WK6Z7qEPwY3x3rpLpkiivyy3CtLcfcfbGsPtVz3oB9ACc21sz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948827; c=relaxed/simple;
	bh=mvhyhVaE1NgOtTceXq0ofadHYAv2ARkQsHSzvKbsxAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zb5QjQcwZxtRW/MK8Uh+zLmsgGCgtogL9SxtQEBGgogvfFOm5J8LkrDrgjFQ32KTYC0sFM6oQhvaQZdnvSoqVi3HJbqBAFeHvvgZy5H9o+HhQlBcjHWmdE0BNrXLNwMMZBZ/b99tX7gWhltHl3gLYHdRTwtxxzKOI8x2E4SECIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNGDXU4c; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNGDXU4c"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d60157747so30081257b3.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757948824; x=1758553624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDVeU4L3YG1TiJ1MEpll75Z/ltEov2CndLJiRR2rTQE=;
        b=cNGDXU4cLMphcRFCN8Amu19B7PiGR84snnbKi6b03nPASBmKDYxWygDtCTMy7CoQ/c
         BQqpXggPD9Ba9nr0NhW82sjz25XMhvoXrgujw59wNecm7ftXx4bROU5UAOsTCUjvXmx5
         mcsIVhbMjmmvEH7usHmLFAQEfeRT+OIjKGpei684vmzLVucuee+1XeEoxk/Mk2VuMkvD
         /jrOufQQe+mwh/TaedkcmX2Hsd4PPS0Mghs8hIQInEODJopGp5Y42Y/ShcVisGzXMpAn
         WQELI82FE7p61lYM8htFC/ZSHghYlJkuhaY9/DIxhKNO9neJcv1heARpaGUoCnOfXMwE
         G1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757948824; x=1758553624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDVeU4L3YG1TiJ1MEpll75Z/ltEov2CndLJiRR2rTQE=;
        b=NRR4dqBMsl8WIh6EDXhOxRqypYckCZRTtlM7qw0NtAXH7nWWR244OHYuI7MjwosqCF
         nV8J04qVsMUVobJdTUH20PEsNKDPC4O+FLkNZoDnj5Z8LPNCMBPbcia56i5wIl6K7RMr
         l3Ffatxo8ydz6BoWF15FuV0nylLTZjUPaG7DCFN3+NphOXLDH9NTkCVEU/Cw2wI9LgYP
         T4U/zJXaZ+C0McReX1gM57ktUknt++UsTgPf5hSfQ5gE1N0A+d15MGBQ2jhPKu/C5FGl
         Vyo7TjCOJFjoKCSMnv5Ao+O0xqonoGEwQaQo7pawA0kSsN6pOv+GDHjOIC+dcblgd3r5
         yODg==
X-Forwarded-Encrypted: i=1; AJvYcCWXuewIv66bLNV4ZXTcp9941XfktJyaMhKgLEk58xfDUNI5riXy2sGRCZ+UX8nvoxnczZ9oKiet7CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiUkbIuZItscZHuugIn0DRIF12EcJqf9nYM2593IMOmd1bRdy
	p1GOyKhDHw1IgxJf/Ov/59SQx+Rz9khZzZctZXgkNoIA2BXWGooO9vIC
X-Gm-Gg: ASbGncslkhtUae3EELcwasWseS3M/klLM2VRPtj4bQzJctPOtgv3S2Tx/ACXjY2MrOx
	tDGeHz4JZbe0nep7yjdUk4QXkTtBpbik9VPOnULMiv6Vg1bT0phGNDsQyKGpiB7NT/0esB9nEoz
	zAwGsX1DYLhCaLC1rFFsu+MY2i32t+gjbnrYcuJKtP3EqMK+K6Gkvm+HkgIO/zsWcag22wLjoVY
	giAOCjjsjGFPTBy898hhiLdkLFu3RQZlZyAYfIF13f0qzYHzb/AFKxciW6m1DVEwFrQP+skq2P6
	OHkVByX/VAix0yugMecOb3kBdfa/6m3jeM4/HR25pvjaRxCrgbr9sQgg50LuloEMNPkTvBvl4OP
	TI0unpGQd9xzMNkN064m66NsQDz4Wczp2QYXFLfsHXCrlrg2VoXC9jV21f+H/w0Ad
X-Google-Smtp-Source: AGHT+IH7pt4IX2Xw7+CU3ZHlHQK6hR4lJhRz8r+4QNMMkKKZ9nkGgDixZer0GbSaS8MxEPVoUip+3w==
X-Received: by 2002:a05:690c:3388:b0:721:5b31:54be with SMTP id 00721157ae682-730650e0036mr114848797b3.39.1757948824149;
        Mon, 15 Sep 2025 08:07:04 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76238392sm32913737b3.1.2025.09.15.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 08:07:03 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	damon@lists.linux.dev,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/6] Docs/mm/damon/maintainer-profile: update community meetup for reservation requirements
Date: Mon, 15 Sep 2025 08:07:01 -0700
Message-ID: <20250915150702.1499965-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250915015807.101505-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 14 Sep 2025 18:58:05 -0700 SeongJae Park <sj@kernel.org> wrote:

> DAMON community meetup was having two different kinds of meetups:
> reservation required ones and unrequired ones.  Now the reservation
> unrequested one is gone, but the documentation on the maintainer-profile
> is not updated.  Update.

LGTM!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/mm/damon/maintainer-profile.rst | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/mm/damon/maintainer-profile.rst b/Documentation/mm/damon/maintainer-profile.rst
> index 5cd07905a193..58a3fb3c5762 100644
> --- a/Documentation/mm/damon/maintainer-profile.rst
> +++ b/Documentation/mm/damon/maintainer-profile.rst
> @@ -89,18 +89,13 @@ the maintainer.
>  Community meetup
>  ----------------
>  
> -DAMON community is maintaining two bi-weekly meetup series for community
> -members who prefer synchronous conversations over mails.
> +DAMON community has a bi-weekly meetup series for members who prefer
> +synchronous conversations over mails.  It is for discussions on specific topics
> +between a group of members including the maintainer.  The maintainer shares the
> +available time slots, and attendees should reserve one of those at least 24
> +hours before the time slot, by reaching out to the maintainer.
>  
> -The first one is for any discussion between every community member.  No
> -reservation is needed.
> -
> -The seconds one is for discussions on specific topics between restricted
> -members including the maintainer.  The maintainer shares the available time
> -slots, and attendees should reserve one of those at least 24 hours before the
> -time slot, by reaching out to the maintainer.
> -
> -Schedules and available reservation time slots are available at the Google `doc
> +Schedules and reservation status are available at the Google `doc
>  <https://docs.google.com/document/d/1v43Kcj3ly4CYqmAkMaZzLiM2GEnWfgdGbZAH3mi2vpM/edit?usp=sharing>`_.
>  There is also a public Google `calendar
>  <https://calendar.google.com/calendar/u/0?cid=ZDIwOTA4YTMxNjc2MDQ3NTIyMmUzYTM5ZmQyM2U4NDA0ZGIwZjBiYmJlZGQxNDM0MmY4ZTRjOTE0NjdhZDRiY0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29t>`_
> -- 
> 2.39.5

Sent using hkml (https://github.com/sjp38/hackermail)
