Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFF3C2796
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750067; cv=none; b=eHsLkkcrWEEEkxvaqqrRwhDGQwwhx2f8EN7URvqEXthgXJ1C923Hupt9I+VWDFKnbVtOJ6tNgq4amERZ1QwoqDp0bNYQpl+2yXWJ/IvKnsDohOoZVdaeyE10OB30yIOVFUQXisW8/ji0PMFGELCXhgTUMvQr0hUqOS7EqXSAfGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750067; c=relaxed/simple;
	bh=C1Szi9KhzXBaZkkjplnR9bi/9qzAItk9Ys0rA3TIbmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jK4YclOszMqx/LWTnzvUZUQDOJGRUp2Nyt8Q472Me8BKLJFSsbCjgA0gseeiJdp2zrsUWWROsea7OVkBTToE9+XAYKs+TiO3w5m0qSnuHWIR+sf//A66wpFWkktAi7PlH+MzwYZ/CGVxjA98LOm+yxil5ISBPQ34rpCUDUG/wxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ET80tH31; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+VvBfmM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ET80tH31";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+VvBfmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773750064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujv/+UcXtXU4RzDARaA3ZzHalRXUnXjoEY0NtoTDpd0=;
	b=ET80tH31FsYZY7yIyMOGrUhN0Dfwsb78O10orM16wxux4OclsRTeKfQd9HulgHQBF6U6jJ
	oU1oFn3FDTVm0ZVHf2YWe8rVOFn760XVYPK38fE3fJnCUlySZMN1Rrq3JuCpWA+NOHLyZH
	kaNSZ5Ad3CFFILxnYCVkNR4ErGM3KSc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-j8RJdHYPOW2CPLDhbFhQ2Q-1; Tue, 17 Mar 2026 08:21:02 -0400
X-MC-Unique: j8RJdHYPOW2CPLDhbFhQ2Q-1
X-Mimecast-MFC-AGG-ID: j8RJdHYPOW2CPLDhbFhQ2Q_1773750062
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f671ceb2so440738436d6.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773750062; x=1774354862; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujv/+UcXtXU4RzDARaA3ZzHalRXUnXjoEY0NtoTDpd0=;
        b=f+VvBfmMEGlI4agj4Hz3EQXaYmv3jV8QRUPM9ZyuHIZlikfZm7v59YbLsHXq2b7/ly
         ddxmTclP8s1pr34yCYVgJuzJgJEuFqLGU0RTsbmRYWiUkK5j7TqdPsnQ+a/a453MH5tm
         fMqjplpohb5kAojRQ7OET1bqBJarCQ9n1GkWzbFzhvyWTgQo7EfyoHXoQf6dcwYhA0Fa
         0D6MqT3Rquvuq8pJ2k5iD32oK+jvxwO7zioF8Mo98Prmf3U6YlkIXmyjxcJun5BEi+xK
         Bt9SvwYe8N7A5oAz0To0INhp4K4V4wOCLazVjOEbTD9ZUoAVKYwMi39u0YmRHzMoMc4F
         xQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750062; x=1774354862;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ujv/+UcXtXU4RzDARaA3ZzHalRXUnXjoEY0NtoTDpd0=;
        b=qvrzdcCZkDyV5lnb2aEa1Hw8Sb4gps7IUV9S2TlBN/ddR0TBmkU6z53rlzbXVNLcQR
         P3PipiX3c8871Wxe9QXYikLisYfcA70XEqAh2WtFUhLOS2uzDUhcRfGDLmqXCpadYQYP
         Se+62YVRg6PSzpXaEcM062hUuEI0maX3CkimXiOGNiuYixjnTqQprbUFy9nW8P7WoeA/
         +owL+3w8fNhTw/ZGYgsfg1QDBRsYUE1N0RC/YM3TB74om0gNGHOUfzny3Os2fAZWjK53
         Eh793AdYLL8JR1bgIf7QX8iA5OAJkVYPE/YNDw5tcipsILe3AlPmTGynY5tVFWeMe12Q
         yW5g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3lTAd+A+SXYvQ/JDCLggrYhHwuquXlv8dJEHh8U03XvJZxBjyazMSDAu51zvBrdEmLa+qDmybD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mH85PpQPXWPVjhf64kBafYW9L9rCMP2Kou3ZKKLx2woZ5YOy
	EpEwG2JupqSUIRypd+iPODc7A44yk7k/WdcTjpxsA0JRYHUprpwr9gejaKz5MuaRETiF9FMoyyW
	KOkscfVsCdOmwZ4RiTXI+pTm5OT+5cghNvclNVjxz/hzdEF5hbLk1Gtsl+PqJUA==
X-Gm-Gg: ATEYQzyqsUveWUN/M7zx4psek2yGvT/wRmP1jwFuK9pYky03eMBRX2Yh/tzZ3dX1tie
	7PoMOmhAgcWXSqOnSA2IbVjXPOMGUVb/eaPocDrMPAH1/a0kFd8yyPPvCG9AkJvBvGvovPFpn/U
	jeIw2vdRRVqa/Wfcq48rI5LoZzlramvJXtm31ssxn89WS7qEyVC0Y8NiMusNb9CLyZinTaxhw8Z
	3HkC1lAjlJIr+NOBnfqF1q5EkJlzxXsoQ2b61eJwaFqb6Nm15rBxr1/aDWzSZPfPaV3zgw9y6kk
	uKZuZHHTkWxJgdQpOuGy4nHWhDGULYWPQq+/Zrz59qm0i8rvt+wTHgA1/x4mcK0eSqAIaL4AbJO
	h8M29xv5VUUMU0WdX7o4qR5MNJOVoohXydrqpCgb+F4BlMfhR+e4lUULv
X-Received: by 2002:a05:6214:21ea:b0:89c:5a0f:2904 with SMTP id 6a1803df08f44-89c5a0f2f3cmr67903076d6.7.1773750061871;
        Tue, 17 Mar 2026 05:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:21ea:b0:89c:5a0f:2904 with SMTP id 6a1803df08f44-89c5a0f2f3cmr67902376d6.7.1773750061323;
        Tue, 17 Mar 2026 05:21:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c54068d77sm40539556d6.15.2026.03.17.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:21:00 -0700 (PDT)
Date: Tue, 17 Mar 2026 08:20:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablHK4t6iQKMWysb@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 17, 2026 at 12:53:10PM +0100, Hans de Goede wrote:
> On 17-Mar-26 08:30, Maxime Ripard wrote:
> > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> >> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> >> discussion about how large number of systems need to boot with
> >> clk_ignore_unused. Per the discussions at the conference, the existing
> >> behavior in the clk core is broken, and there is a desire to completely
> >> remove this functionality.
> > 
> > Broken how?

One of the problems that I am aware of is that clk_disable_unused() runs
in late_initcall_sync(), and the intention was for it to run after all
of the deferred probing happens, however, it actually runs in parallel
with async and deferred probing. So there's a race between these
actions.

> > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > documented as a silver bullet, when in reality it's just a debug tool
> > for broken drivers, and the driver must be fixed.
> > 
> > But nobody is actually fixing it.
> > 
> > See
> > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > fedora wouldn't have to package anything, change anything, etc. But no,
> > the problem is clk_ignore_unused.
> 
> Both things can be true at the same time. Yes there are ways to work
> around issues causes by clk_ignore_unused and those ways should be
> used more often. And in example of the X1E laptops I do indeed want
> to try and figure out which clocks must not be turned off and
> try to see if it will be accepted to mark these as CLK_IS_CRITICAL.
> 
> But at the same time the fundamental concept of turning off all unused
> clocks as soon as all *builtin* drivers are done probing is a broken
> concept when working with generic distro kernels where many drivers
> are modules. To me it looks like this was very much made with
> embedded systems with device specific kernels where all drivers for
> the used SoC are builtin.
> 
> The problem basically is, that if we want something like disabling
> unused clocks at all (1), it should happen when all drivers including
> those build as module have had a chance to run. ATM the clocks
> simply get turned off too soon.
> 
> Also see Stephen Boyd's LPC talk about this:
> 
> "Make sync_state()/handoff work for the common clk framework"
> https://lpc.events/event/17/contributions/1432/
> 
> When the clk framework maintainer themselves are arguing for
> replacing the way unused clks are disabled atm with something
> better then to me that is a clear sign that there is something
> wrong with the current mechanism.
> 
> Arguably it would be better to tie this into the deferred_probe_timeout
> mechanism with some way for subsystems to register callbacks for
> when the deferred_probe_timeout triggers. This way there will at
> least be some attempt by the kernel to delay it until all probing
> is done.

One of the things to fix is that not all clks have a struct device
since some need to be initialized early. See of_clk_hw_register().

Brian

