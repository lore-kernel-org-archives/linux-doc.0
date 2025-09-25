Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EE29ACF0
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758810032; cv=none; b=XYAqJ/93wMkyXCO1zp7GN+KATFymNxlqex807h2wUkIUw2jiEiDC/8IZsKjXpMm3Frp6OjbeHWQYwl0TUjxeqTmgzl1eK20U/uhA7ZkShPsOQswjUQR/AubcMY3LtCP2zuv4Ts7FK+u3LOrpYjRZIwgJ8Oct+Us/R65wTOXygEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758810032; c=relaxed/simple;
	bh=9S5P/Bdj720bk805Gz5LUXF0wAlaDIZ4nUN2ksl9Ab0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoHPp2HAicDkMvP0kwwAeTfbONzdAd0CYRWVwQ0vSAGbhF5Fi9PAhwsHIsyPhjSSOB1oW4Rr08cMweyA6RYDCP4b1AJ6ueDjUfv8y6r3yc9YkkTG+7y0BfCGNdpxTcFWY7CAWMeKPgdfZr3fA236HHNar1st0yw8h/QGENELr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKU7gyTm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKU7gyTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758810029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOKkbCQdz4s7kFS4NyoQHb7rePtHYRhLO7DwNkxy16c=;
	b=aKU7gyTmsyEz6o5P8GwtqJIQ4YvAc82jlDU5QZ43dcPRnAvvgUC6aZpEE78DL9XiGCwyF3
	GjNTNeNNqf7RfZx1hK9WqQUbYow+n1/FulGifs3nn4tGvQjKpVCJpXXytKbiO2wj0h8x6G
	/9m6vuiDeyjepvfXSQSAkegz6GBs/rs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-1-4LSFLMM2el1DcS4oXF8Q-1; Thu, 25 Sep 2025 10:20:28 -0400
X-MC-Unique: 1-4LSFLMM2el1DcS4oXF8Q-1
X-Mimecast-MFC-AGG-ID: 1-4LSFLMM2el1DcS4oXF8Q_1758810027
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d413127749so21633521cf.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 07:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810027; x=1759414827;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOKkbCQdz4s7kFS4NyoQHb7rePtHYRhLO7DwNkxy16c=;
        b=XDwoAmY0ijVxeNEKCm1HQOZu6dhpLKiXSVtjNWcaTtIv5Ux1v7AOEsb2RfgO8APQpf
         f3/DBLVdlO98HPMUgUOZhuUGeugvhUqFw63qJrb4i9lKM4J2AvPV0OS9e4+rq0CGd8nz
         4i6nX7sd28WA/XM6IiarTiKULJl6cAQNwrxhV/12rB7A6UzkusZLJEsa5AzpaIHPj502
         w3U+FW69T9GPkTktox6HiLbE1pfo+GfiyVyw42Mqo7vj679zwDC/aXM8XCrB6b57l7TR
         8Kv3iKyXOI6TLWmqhLGkts9VXxp+umVKT5dGb0DerJEdHyrHWu5mqbzV3Naw7yGoditV
         ozxg==
X-Forwarded-Encrypted: i=1; AJvYcCUAmnxfPYn9Fy/C7x2LoP0xIHbjBr7+Np2SiDAYdwFLWG3rgkO236gjJ5WSYJitSxrwFdJuuAflITc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8us6PlalTddTUPxUhRrxPzxwX2jghx7y25ySsCi61B/xz/j6g
	zsMFEGsX0nLqy5vYHwhQ6jD8bk5Jhy1t3I1jijOvk1WIStdtrbFMaFhczdyn3jV0ko63t3lZhbQ
	Lt4NxzrskI5jUD2uYpz0awLqaLo3XYIwyXfmCptfDZyNnD+Qz0SMh7AqPyMG8rA==
X-Gm-Gg: ASbGncsfs2PpYazEd0DYp/dJFOyWMIDDsR7Mz+ecRZoE0yqcMTv3fddCry4/EPOw9t9
	rf6Whp/bTF5PhDFm8zkMSCF3kdwlL/mzUx9VLXzz4d0VhfnB0fkpMi83j2XTAzCR20MfEgJd+pa
	CUbqFoj1UaOXfxKdtN3iH0mTbpQHvGdrjlt+6C4jxac/i2LKH3AWN0GKC2JKfcl9ERaz2yrzWtP
	efUHiUOWLu5CEKW4WO7XHpSCrz7SrmL4XqDEjB47EABxAgaYVszCknNBGe2rksZR6g9jTlUOWJT
	6AeVczRu5CUcF2FOTGVbctSaS7f4ZxcPh3tHWL/GVoNzh5bWTc9hMvfAQNciJBqGeSPpSIfTydi
	/rRtyhVVwrBVAu5GT7pJ5nwymjFvrriQ=
X-Received: by 2002:a05:622a:5e07:b0:4da:7d53:c01f with SMTP id d75a77b69052e-4da7d53c586mr25949791cf.28.1758810027222;
        Thu, 25 Sep 2025 07:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzAMws7Y35IXPj3ULsxxU+kNGPjPFIvTWHEyCz1nsMPS1pfVod6yEtRsWbHOX7yetDXHZs8A==
X-Received: by 2002:a05:622a:5e07:b0:4da:7d53:c01f with SMTP id d75a77b69052e-4da7d53c586mr25949321cf.28.1758810026700;
        Thu, 25 Sep 2025 07:20:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db1087267csm10756031cf.26.2025.09.25.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:20:25 -0700 (PDT)
Date: Thu, 25 Sep 2025 10:20:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <aNVPqHldkVzbyvix@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925-eager-delectable-frog-fcbb5d@penduick>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Sep 25, 2025 at 02:14:14PM +0200, Maxime Ripard wrote:
> On Tue, Sep 23, 2025 at 10:39:19AM -0400, Brian Masney wrote:
> > The Common Clock Framework is expected to keep a clock’s rate stable
> > after setting a new rate with:
> > 
> >     clk_set_rate(clk, NEW_RATE);
> > 
> > Clock consumers do not know about the clock hierarchy, sibling clocks,
> > or the type of clocks involved. However, several longstanding issues
> > affect how rate changes propagate through the clock tree when
> > CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:
> > 
> > - A clock in some cases can unknowingly change a sibling clock's rate.
> >   More details about this particular case are documented at:
> >   https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com/
> > 
> > - No negotiation is done with the sibling clocks, so an inappropriate
> >   or less than ideal parent rate can be selected.
> > 
> > A selection of some real world examples of where this shows up is at
> > [1]. DRM needs to run at precise clock rates, and this issue shows up
> > there, however will also show up in other subsystems that require
> > precise clock rates, such as sound.
> > 
> > An unknown subset of existing boards are unknowingly dependent on the
> > existing behavior, so it's risky to change the way the rate negotiation
> > logic is done in the clk core.
> > 
> > This series adds support for v1 and v2 rate negotiation logic to the clk
> > core. When a child determines that a parent rate change needs to occur
> > when the v2 logic is used, the parent negotiates with all nodes in that
> > part of the clk subtree and picks the first rate that's acceptable to
> > all nodes.
> > 
> > Kunit tests are introduced to illustrate the problem, and are updated
> > later in the series to illustrate that the v2 negotiation logic works
> > as expected, while keeping compatibility with v1.
> > 
> > I marked this as a RFC since Stephen asked me in a video call to not
> > add a new member to struct clk_core, however I don't see how to do this
> > any other way.
> > 
> > - The clk core doesn’t, and shouldn’t, know about the internal state the
> >   various clk providers.
> > - Child clks shouldn’t have to know the internal state of the parent clks.
> > - Currently this information is not exposed in any way to the clk core.
> 
> I recall from that video call that Stephen asked:
> 
> - to indeed not introduce a new op
> - to evaluate the change from top to bottom, but to set it bottom to top
> - to evaluate the rate by letting child clocks expose an array of the
>   parent rates they would like, and to intersect all of them to figure
>   out the best parent rate.
> 
> It looks like you followed none of these suggestions, so explaining why
> you couldn't implement them would be a great first step.
> 
> Also, you sent an RFC, on what would you like a comment exactly?

Stephen asked me to not introduce a new clk op, however I don't see a
clean way to do this any other way. Personally, I think that we need a
new clk op for this use case for the reasons I outlined on the cover
letter. I am open for suggestions about alternative ways, and will
gladly make modifications. This is why I marked this series as RFC.
Patch 10 in this series is the main change of note here.

Additionally, the presence of the new op is a convenient way to also
signal to the clk core that these providers can use the v2 negotiation
logic. Otherwise, we'll need to introduce a flag somewhere else if we
want to support a v1/v2 negotiation logic across the clk tree.

As for 2), I negotiate the rate change from the top down. The new_rate
is propagated in the same manner as what's done today in the clk core
when a parent rate change occurs. I let it reuse the existing rate
change code that's currently in the clk core to minimize the change
that was introduced.

Regarding the clock table in 3), it could be done with what's there,
but there's the issue of the new clk_op. I posted this to get feedback
about that since I think we should settle on the core changes.

Brian

