Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0A1F5F6
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 00:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102623; cv=none; b=oQajobSFpISmhgu6C6hB3YNSY2PQAIKQjHwEj85mEpGAp4R9JixN9RqZ8b9IE5JXo8rVsujZX5T393vcixs+LyftH3pA1K72j12gziTeiJEba860WHsvdI9F4pzi8g2CididIcJ5OkbsmqxYbsmsAywRXLHnGFxrmybqUlRNWq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102623; c=relaxed/simple;
	bh=x5RWrMiWaKU8g4N4Zudf9cQiNzypszD2JqK2icLltJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ldc6d4+Xc9gf/ZIOdXaT6GTCbvrQVxoyRC8dobXl6UhbdgrQikif7kKcxhBeEPkLgQRgXWOYVt9oEK0Pk9YrZXHlV0nVR/haJvjUIwrpwPWf++g23nqMT4XneEJ5q+3sSJ/qPTWz4BfLo6chtl7P0uqj1aN0gGqbGaDNxDWq+Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ih23lVDD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZAUmTmLV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ih23lVDD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZAUmTmLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766102619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3xCK2ep+l8L+LYfas46rRp+A2nbh8UwR2dn2lWqo60=;
	b=ih23lVDD/vtUGmVQj+e5nkOZtJ/2KKLXY8UkPV0kDr1karehbv4igTGPSPbOau1il5GcId
	nYyTVy7r8ZGxy175pgQ/eqdY5TezWszaELHNswFXBO5bcKFMr2lfdUYYc+fn5cQ5yxwm5N
	BpVm5YxIdlXmKOhwK+kgQvRxdtN5yqg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-0vdzbNMbOk2n9WCBynHLag-1; Thu, 18 Dec 2025 19:03:38 -0500
X-MC-Unique: 0vdzbNMbOk2n9WCBynHLag-1
X-Mimecast-MFC-AGG-ID: 0vdzbNMbOk2n9WCBynHLag_1766102617
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so536079985a.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 16:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766102616; x=1766707416; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g3xCK2ep+l8L+LYfas46rRp+A2nbh8UwR2dn2lWqo60=;
        b=ZAUmTmLVlTf0wTE6wfng2fNH/IM0iQn9o01TW/7hGOx91xW4dK83iO1EgpQ8c0aNJo
         zn96Gz6ZolAbKJ4yKSXjMr85kSec167/iP+0FhWN1z9nMfIq/ULPeD/qQndF/bMVJOpM
         w0WPs0H1qlw07TGXkv2qP99qEy0wZrqEFcK2/8CBXSN8PAhpE5zOzEdsNVHOezaRCHMN
         U1EhhpxSwC7wtOSWMa0q90FqFzvkmE19lNTApjso1velYYUpM2Uai6erIoK+bfi5lrR5
         JgA5C6oZ5fPK7XTEvSQOBX+yXWl7uPoAihcTWeid/R9MN9IuYj1cUKk2snqDR5mOlHrB
         UcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766102616; x=1766707416;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3xCK2ep+l8L+LYfas46rRp+A2nbh8UwR2dn2lWqo60=;
        b=cEI0mWqtqY/Xba9EFM74S1aq638zWKEsD4Z5pcEiRy9sfJnsxO7kBtkHjDm6dsVOdO
         kn1oEgh9FAHiYW07JzjcJM3EpYBEEoQ26VisIVG0IGQZmbckQQGN1JmpMRFJooI/YypB
         9+KI2A25HZXR19FYag//0dIiRA2zG0d3YO/w9k8zd+12YmQh9AlsfEMUjoI2PiJ+0b/i
         0zosfjrypS0YXnnAlYPF8B1QZ0qkSnoBwiGV9tBgQ22auUNAVcUSCO0OL4IvAb7+Jili
         jhJ+BxzCXZ0HYf47yAfFKrBSm/OrBZufzStGwkSMV+GHjIHzBt9hZVycnOrAXDoqGfU5
         8XBw==
X-Forwarded-Encrypted: i=1; AJvYcCXUhdJceBuSrNOC2XSA3qWb+MPMNAy9lhZ9QLIkUQdLh/SZZEafTuXO+xccFvCoD0TWo1Il994OELs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXbA3BRLXcR2cGpJW6UzkuXEYiHHJ85KulmD2bkg23HKF9+w/
	lqrUUP5b0Wwg79D0AEmT7d/zxizgV97yDX48lvLTu1dwGmzd0+EldmTDvjMdvkmlHPWIKS49VQo
	G80NuyTA9ZIbH4HV26zmdoGiH986uIeuAU8kA1ifx1s3jLQRVKS51XMYZcJcWzPsfYCdj9w==
X-Gm-Gg: AY/fxX6YK0lQmSrKetxpD75HHSDhTsZVcxeZgTXDbl1/9o8nrMpsVQhJzgqX+ppumlR
	qqsvly4U8yKLWX5TsH9WL8/ViZDtIR7EZULX/wkVv/UZsrx88n7Ca/OAO/Gm5f81nx4/NcL1C8H
	uIjEKEBFmsdKVuIQ9+BXPR3t1lOBD04BhISv7SLUsd1tgaVPo7r+2QnNY789cYjO1AUa1yWezy/
	iph2BUdZ2fZc9RRFx9EcAmdUUuhNcso0bTo4RtjLY5Ml8CFpF9bHf9jzPIztvesyWt3D3tFHoxj
	eokrr4IrZvGLUJYNcVkclAxTNa2g+Kro1tU81b/tf3aVPYGiX1EORYtbaAZSItQU0JIXIBzwrYw
	6d+g01iY=
X-Received: by 2002:a05:620a:4725:b0:8b2:f2fd:e45b with SMTP id af79cd13be357-8bee79ca97dmr749297685a.36.1766102615898;
        Thu, 18 Dec 2025 16:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo7MqUZx1QPyENqkc02VYI6aP8FdDnn8/fughE/h5/HvcuPFOqo+fyNsSnz4VM/XGAJNrN7g==
X-Received: by 2002:a05:620a:4725:b0:8b2:f2fd:e45b with SMTP id af79cd13be357-8bee79ca97dmr749293385a.36.1766102615429;
        Thu, 18 Dec 2025 16:03:35 -0800 (PST)
Received: from redhat.com ([2600:382:812c:5c2a:d26d:b7f:4624:dd34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d96ce3907sm6896516d6.18.2025.12.18.16.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 16:03:34 -0800 (PST)
Date: Thu, 18 Dec 2025 19:03:31 -0500
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Alberto Ruiz <aruiz@redhat.com>
Subject: Follow up from Linux Plumbers about my clk rate change talk (was Re:
 [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate negotiation and
 kunit tests)
Message-ID: <aUSWU7UymULCXOeF@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick>
 <aNVPqHldkVzbyvix@redhat.com>
 <20250930-brawny-pastel-wildcat-4ba8d8@houat>
 <aRfH35-jhM-qOrbb@redhat.com>
 <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
 <CABx5tq+iOpwLDy0VaQt4k9mLyAb8SF3WGHPFh+rwvT9=J4ZnKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tq+iOpwLDy0VaQt4k9mLyAb8SF3WGHPFh+rwvT9=J4ZnKg@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Fri, Nov 21, 2025 at 03:35:10PM -0500, Brian Masney wrote:
> On Fri, Nov 21, 2025 at 11:09 AM Maxime Ripard <mripard@kernel.org> wrote:
> > > I'm giving a talk at Linux Plumbers in Tokyo next month:
> > >
> > >     Fixing Clock Tree Propagation in the Common Clk Framework
> > >     https://lpc.events/event/19/contributions/2152/
> > >
> > > Stephen will be there as well, and hopefully we can reach consensus
> > > about an acceptable approach to fix this.
> >
> > Yeah, discussing it at plumbers would probably be a good idea, and maybe
> > try to record / transcribe the meeting so we can have the minutes too
> > somewhere?
> 
> The talk will be recorded, plus I'm sure there will be discussion
> after my talk. I'll post a summary to this thread with the next steps
> after Plumbers.

I presented a talk at Linux Plumbers in Tokyo last week about this patch
set:

    Fixing Clock Tree Propagation in the Common Clk Framework
    https://www.youtube.com/watch?v=R8TytDzlcFs
    https://lpc.events/event/19/contributions/2152/
    My slide deck is on the second link. I didn't present all of the
    slides.

In summary, I made the scope of this patch set too big, and this is an
intractable problem the way I currently have this setup. Some boards
are currently unknowingly dependent on the existing behavior, and we
need to keep things the way they currently are. We can detect when rates
are unknowingly changed by a sibling, and log a warning, however some
systems are configured to panic the system on warning, so we don't want
to go that route.

Most clock rates are fine to change with the existing behavior. It's
just some clocks that are dependent on a precise clock rate, such as DRM
and sound, that are affected by this.

The way forward on this is to leave the existing behavior in the clock
core, and fix this in the clock providers themselves. When a rate change
occurs, it can walk down that portion of the subtree inside the clk
provider via some new helpers that will be added to the clk core, and
ensure that the clocks that need precise rates will have their rates,
and their parent (if needed), updated as necessary. An array of rate
changes can be added to struct clk_rate_request, and the clk core can
update the clocks in that order. So it'll be up to the clk providers to
ensure that the array is populated in the correct order.

I'm going to get this working first in kunit, and I'll post a new
version of this patch set with these changes. Once that's done, I'll
work with Maxime and some other folks to find a board that has this
problem, and I'll ensure my new clk patch set is able to fix the issue.

Thank you to everyone that attended and provided feedback. Please reply
here if I missed something.


Separately, I talked to Stephen about ways that I can help him with clk
maintenance. Here's some information from my notes:

- I converted from round_rate to determine_rate() across most of the
  kernel tree in over 200 patches. However, the only remaining patch
  set is to the phy subsystem. The patches have received Reviewed-by's,
  however I haven't been able to get the phy maintainer to pick up the
  patches. Stephen mentioned he can pick them up. There was a merge
  conflict against the latest linux-next, so I posted a new version that
  addresses the merge conflict.

  https://lore.kernel.org/linux-clk/20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com/T/#t

  Here's the patch set that actually removes round_rate() from the clk
  core.

  https://lore.kernel.org/linux-clk/20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com/

  We still occasionally get people that try to add new round_rate
  implementations. I try to catch them when the patches are posted,
  however I miss some across the tree and will post a patch when it hits
  linux-next. 

  Someone two days ago posted a patch that adds a new round_rate(), so
  it'd ideally be nice to get my two patch sets above into linux-next to
  put a stop to this.

  https://lore.kernel.org/linux-clk/20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech/

  I commented on that patch to drop the round_rate.

- There are maybe a dozen or so determine_rate() implementations where
  it just returns 0, and it lets the firmware deal with setting the
  appropriate rate. Stephen suggested that we add a new flag to the
  clk core so that we can drop these empty determine_rate()
  implementations. We didn't talk about a name, but at the moment I'm
  leaning towards CLK_IS_FW_MANAGED. If that's set, then the clk core
  will not allow determine_rate to be set. I'm open to other
  suggestions for a name.

- I will continue to help review changes to the clk core. As for the
  clk providers themselves, I don't have access to the data sheets, and
  I can't really review those in detail. However, I think it would be
  nice if we add some extra clk-specific checks that we can run against
  patches. Look for common issues that come up in review. Look for cases
  where some of the helpers in clk-provider.h can possibly be used.
  Chen-Yu Tsai pointed out that's may not be entirely accurate in all
  cases, but we can at least warn about it.

  Another case I thought of is if someone posts a patch set where the
  clocks referenced in the dt bindings don't match what's actually in
  the clock provider itself.

  Make this as a clk-specific check script, and ideally see if we can
  hook that script into checkpatch.pl for clk-specific patches. My
  perl days are long over though, and I'd like to make the clk check
  script in python.

  Anyways, with a pre flight check like this, I could help review clk
  drivers themselves to look for anything else that's out of the
  ordinary.

It was good to meet so many people in person at Japan.

Brian

