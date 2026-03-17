Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89C3C140A
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750394; cv=none; b=k9PKHqgwrK9jXN6NvKDKfvpJbcYkopjPy/K1t70RT1LIk6rJlYlDbGGm3j80QVu+NP3d764nSZSoC4uEb2XOjjqQtmVjy8+xDw0IpnkuG2DSMA/FyVV+D8i3Zeg69Po+BL+pwKzvJGMEPkkyER33oniCIMfxI0Gd1T59se6X+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750394; c=relaxed/simple;
	bh=yc/kkBw6SpWu0OvYbApVk/Tn/fR+d0nZqZWEFwCR5uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCoGalMHMm7xavgrnOC0c4ar5PME5PU+NtB094l+AR41TpfXnK1OPKnKG6BylT/si2n3CP2AMtVkQPhTOjregE91kPiO04RF7UczO2WkrpMguWNTWP51hE3tRBRzL9j+wd9JYZaY2SWUmBwBLCMhi4PAs4Q8DKbDm6PD8UOK9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RTf5Aub7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/7nWmUw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RTf5Aub7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/7nWmUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773750392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CX6eu/HWH2lLWhCaUcOwMequpqLf3+91QGi4lPX1PnU=;
	b=RTf5Aub7efO76+rPDKJb15ZY1iAOTL4Yyz4D3Og1C4edxOrrVVrk15pBPbzeO0YXOXOmQn
	s3/u3XFSKILKAuf9JluUhINy8oRN9U/rkMhkWkATwrV+TJSZINRj2ScP6rvAs3FbN0bVnZ
	KCvOetsj1q6WU9BebOGWOKj6PP2hdZI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-92eZ1DzzNPiGL0DNbwjxrQ-1; Tue, 17 Mar 2026 08:26:30 -0400
X-MC-Unique: 92eZ1DzzNPiGL0DNbwjxrQ-1
X-Mimecast-MFC-AGG-ID: 92eZ1DzzNPiGL0DNbwjxrQ_1773750390
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da6dso3381941cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773750390; x=1774355190; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX6eu/HWH2lLWhCaUcOwMequpqLf3+91QGi4lPX1PnU=;
        b=b/7nWmUwKsF2YUGJ8EBSh41DEZuwjUQXXr8ixGH06rXbDS6HxEO2fSeXQ1LwLMhrXZ
         8tIVdTLQDwr185kfTaAvL/qzDXcPJRmA1FJ8+G9ef4SSIyCBV8fnrU4KPHLllHFp0zNU
         X1wtBaqwkvh4NGRdRsA9rJHBc82UtdlziWPDR1YZ1jFF0aths5Evaw5K4C4fc+3CKLKZ
         Ho9oGluJYu78CYAaGyWW8dJNHWMTr6Hrte9kdkj4NfFehOvCNnN4dykZt2KUe5IwCAix
         HtUsCdEr7Fa8MjOhowZ/PqTEPpHiBdIvNnEF8RIASQtsPa1nbsmQKlvMOWBgKDH/TVqN
         wI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750390; x=1774355190;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CX6eu/HWH2lLWhCaUcOwMequpqLf3+91QGi4lPX1PnU=;
        b=mFGRq2Y46GIDW7EzBx+qZLyH3JF/hPKbKSY7NZDsPjwNtIqoX1ZgNnQ+mJcpXFg3gu
         8xJmuk6LE+YXg1mo5+kySassDT9OkVNr8E42oAUbN2iQrn8ip8zBNbEy9ecj9EGjCvt8
         eRVeHuqC5hKp0pFyBQMa+ONTBbK1NjLEaGEcOvbFoO8c7PnDMjF2RIxdlHoU0YiOvs+2
         RG/H8dLtQpD/WfY0KosuHSsHYwD634rXq1Y/MQu3wuSxBa3XndVoHfZ3Mrp5ShFvZuR9
         2DFRwHIVf0Ujulhiur2jBgFErn44Pv0NLSx8dSlwPnTcYSvTiZyX7UVGJ3RXWckomQra
         MmSg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ISeOpKusZoXrfOA5npQUXeg7QnC2/2GvgvF5Ceof0oiow+nivZGFHlcgZ4iE0j/oc0GwwTmJz4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP8xjqqdvDeMezwEWzjiLIlTEuvBdHG1nWxRDElQchK/tS4Hmd
	fU+Atjoy+Lfyvsg0F5W2E9FlVL4L4dDqtAZUNtVAN3RS/FcPp9xWLFvZgmvPdDWJHhmCh/6gv0X
	hQippg9ueTkIJMqiAiMVc4RxTkv8vx15RMz1Udj15aVUhKdQc35si4jocDqb8ag==
X-Gm-Gg: ATEYQzwXtNL41HTE357ycjvI/OG2/9ZEjWu1G3U+V63nLIj4GzanVJZjQ7t/cA2sx3w
	ORRvOgqOkDV8XFeKmRuDAwjWcmoB7Mu8omBzPnPDdLqnPyBbNS8mNKuaP0prrSxzeTih1JxVkbx
	pcHmtlWHPFBuHB168qBUpzFDJmENO0bBoUAteNRFXOofpkPYGntO2AeZtOjWBdT4zTA7ajZPRPh
	8Sq4h3AwnVK9WCMEUPE6SrKV2t8mQTebGitQTYMNENztf8HvYCR7O1GhtgykHck//TqKP5p5DPr
	ulF61zQeL98mPM6f2sOQr6S7saEwgmoN2yyRJnsi7NgIebgkbhQIfVE19gTYFUn6WpznG/aSXaN
	eF9ff0pJRqjqCG+2E8AfbjZBAjc/iLTvvsdg/iXM6qPPdyEB1/9qYKDRJ
X-Received: by 2002:ac8:7f0a:0:b0:509:1949:7b36 with SMTP id d75a77b69052e-50957d494f1mr211113021cf.30.1773750390342;
        Tue, 17 Mar 2026 05:26:30 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:509:1949:7b36 with SMTP id d75a77b69052e-50957d494f1mr211112661cf.30.1773750389867;
        Tue, 17 Mar 2026 05:26:29 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a146218sm134608351cf.30.2026.03.17.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:26:29 -0700 (PDT)
Date: Tue, 17 Mar 2026 08:26:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablIc4OkoJvdeddT@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Hans,

On Tue, Mar 17, 2026 at 01:16:33PM +0100, Hans de Goede wrote:
> On 17-Mar-26 13:14, Abel Vesa wrote:
> > On 26-03-17 08:30:24, Maxime Ripard wrote:
> >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> >>> discussion about how large number of systems need to boot with
> >>> clk_ignore_unused. Per the discussions at the conference, the existing
> >>> behavior in the clk core is broken, and there is a desire to completely
> >>> remove this functionality.
> >>
> >> Broken how?
> >>
> >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> >> documented as a silver bullet, when in reality it's just a debug tool
> >> for broken drivers, and the driver must be fixed.
> >>
> >> But nobody is actually fixing it.
> >>
> >> See
> >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> >> fedora wouldn't have to package anything, change anything, etc. But no,
> >> the problem is clk_ignore_unused.
> > 
> > Nope. Don't ever mark clocks as critical unless system crashes without
> > them.
> > 
> > Here is an example or why clocks cannot be marked as critical but need
> > to be kept by the clk_ignore_unused: display driver probes later.
> > If you mark it as critical you just made the clock stay enabled even
> > when display is off.
> > 
> > And this is just one example.
> 
> Interesting, so maybe we need a new way flag to mark clocks as not to
> be turned off when turning unused clocks off, which does not block
> them getting disabled normally later ?
> 
> (I was under the mistaken impression this is what CLK_IS_CRITICAL did)

There's a separate flag CLK_IGNORE_UNUSED that can be used instead.

Brian

