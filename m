Received: from mail-dl2-f39.google.com (mail-dl2-f39.google.com [74.125.229.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E344CC604
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281935; cv=none; b=doW9memr/vFrQBQt5oq3XgA1m4uwy8u255FLqP2+XwGnufD7Y5flrvvSLpxIo1x+frnQRiVLGlgwm7jJASLYkoAFlneO/sLKJPDQT8Tl70Ea9KhqdeJyR16o7IczGg4zrGvSgxUAO8Pzsm/Jt+4Wjr/LSSJmIZVbo+SQTkv4BCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281935; c=relaxed/simple;
	bh=v3fnB7xz+w9vdQgoBzGCx0rltywWs4k7dX0JJ8+/yM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yq/MN0297IV4EPJ1vIhQJjqvpyptkDxcJpkbl7jtkEZFyjhYQd5GAQRna+5a3KNg1+MTZKG53vY5puuetuH6wI/IPIfOfVt4fmr3jgsHnMGgTbo/ad32veOccQCLECpAqOqgEZpK8YyR8rQm1FUVN2zcW5nA2t4DLB+mEjtyVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N/JI4o5I; arc=none smtp.client-ip=74.125.229.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N/JI4o5I"
Received: by mail-dl2-f39.google.com with SMTP id a92af1059eb24-1438cb9b3a3so228448c88.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 13:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790281931; x=1790886731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvGsLC6n0EXaAgGju5mJ8B3bsonAIhyXpY3nurvIZ6Y=;
        b=N/JI4o5IR9f6ZEfB5gFtUA+nqKBxB4AsvxhEJ0Zg3BwkleI4ZL3jzVUf1S5J/fnxUC
         nh/smWHq0r4/Q1ZzMalynCXjCSN8/1OVIQxvRzu8OciX6ip/7E1Dbu0dTovgb4jqYbVQ
         8SiNfOcXTN2iX+4tL7l1KARWkeWkzb9F/XPFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281931; x=1790886731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZvGsLC6n0EXaAgGju5mJ8B3bsonAIhyXpY3nurvIZ6Y=;
        b=Mnj47RFFB3Dcthz/bSKbRBx5gi4keuNbmU/nJgjgTj6UkkxrFlRQS5cWxZtTLqQ44o
         zMChLgeY/z6n+MkDLd6++e+dfXRQ2LtiaTM2FRla9a9vs2UtNvqEETvfc/wPQaYo0w84
         EdGfDZ1FzCsZrbctNRPuUyTsstx829sczSH5MY09P3wFO9aH5nyTuYwpnq2gTHPKLHsx
         sbCRtFghcjzKx2Adu2zJp0y2m06sctk7my/NbhnSVm7Zqq6BMLReDOpuzXI798p+pxoo
         Gk3Gn9yDjNK3zesB3v+ux9VoSIxSSBa7riaKvlP9Gzmj7eiwTi+8nguAMIQ/umsI0kui
         dPbg==
X-Forwarded-Encrypted: i=1; AKwUvBwk1b9s0tGu6MzCA9FcyDypA6e9Z1/g0GOMI6YRH0c9Z86wSuAvPqKTV4eZ8vRYtlB/dq7ThIRZdsE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyhelQ7+mhU252W1sL7w3L45JL9o5/IQn5siAYPq9a8XMy/oe8
	ZaZA5awnwHJoCCoMxGfB69UDw9MVsKmWPdVeoCxEXHB4c3IgmaxzemkSPtWY9MKCKg==
X-Gm-Gg: AYBFou3sllkAxYKEoNiVZ8uJ0f/AcSOCgodihVwTuTOm+irevRfSL96Q9CEwAiaK8zi
	/CtklsaJxtHRlFsdyhKljGkX30EN1e7IJY+wMfzW2vsjLlGw8jaVgwovLBOxWpNtXiS2x1KJEMN
	jllKXNa8yGxcG0aOWRVIrpxEZ2FrfP7vqzHA6gecSrLSeDPOvK+f1BgCa7yZ+C+lPSmVjN6GJvG
	fGezWEY6qmWabZAUZlrbNgquYj3Jn8ApRCOmztBuMd/gPgXBEmegeFztlTTjGXgRE6Nv06jVMJk
	NpCDEQg7RsXcYTrqHnlSXmGo7aDq1r7x8yEla0Uvz1j5WOQ/WhA1kBm1DcdujUznE1fG/0OPmTC
	tMTM3qQLS9Hdm1SN6xWFTycUVtMlIKRy3i27vBncZqclHjKQJVb7eYeUvEX2YF7IJ2bhg0GNf98
	ubHWmAZ1iRdvYniubiYlrCcZej5dCrY9INsINMvOgvk9xp0lvWphDIecbcenBY49LJOnfy60BbU
	EcrZaj5y3kAa768fAiDKdNKaXeBRrm/NZHVRafsHdMX7Cfd
X-Received: by 2002:a05:7300:7312:b0:33b:dd45:716c with SMTP id 5a478bee46e88-340cc11f887mr2475296eec.13.1790281930898;
        Thu, 24 Sep 2026 13:32:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b9bb:8d53:6635:9f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34144757f31sm1220938eec.14.2026.09.24.13.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:32:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:32:08 -0700
From: Brian Norris <briannorris@chromium.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] PM: runtime: Add Example Driver Patterns section
Message-ID: <arWIyLcKuyFvp2Ko@google.com>
References: <20260923174711.1283986-1-briannorris@chromium.org>
 <20260923104031.v2.8.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAPx+jO843h9bOeWNATHm8D2afbniQsX7WECJzCxmfi9ZcH9+5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO843h9bOeWNATHm8D2afbniQsX7WECJzCxmfi9ZcH9+5w@mail.gmail.com>

On Thu, Sep 24, 2026 at 04:13:30PM +0200, Ulf Hansson wrote:
> On Wed, Sep 23, 2026 at 7:48 PM Brian Norris <briannorris@chromium.org> wrote:

> > +Basic Probe
> > +~~~~~~~~~~~
> > +
> > +A driver that powers on its hardware during probe and does not use autosuspend
> > +can initialize runtime PM using device-managed helpers:
> > +
> > +.. code-block:: c
> > +
> > +       static int foo_probe(struct platform_device *pdev)
> > +       {
> > +               struct device *dev = &pdev->dev;
> > +               struct foo_priv *priv;
> > +               int ret;
> > +
> > +               priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +               if (!priv)
> > +                       return -ENOMEM;
> > +
> > +               /* Power on and initialize hardware registers... */
> > +
> > +               /*
> > +                * The code above left hardware powered on and operational, so
> > +                * tell the PM core that the device is active before enabling
> > +                * runtime PM.
> > +                */
> > +               pm_runtime_set_active(dev);
> > +
> > +               ret = devm_pm_runtime_enable(dev);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               /*
> > +                * Alternatively, the above two calls can be combined into:
> > +                * ret = devm_pm_runtime_set_active_enabled(dev);
> > +                * if (ret)
> > +                *     return ret;
> > +                */
> > +
> > +               /*
> > +                * Upon successful return from ->probe(), the driver core
> > +                * automatically executes pm_request_idle(dev), allowing the
> > +                * device to suspend asynchronously if its usage counter is zero.
> > +                */
> > +               return 0;
> 
> The above looks nice and simple, but what happens in the error path is
> equally important.
> 
> In principle, nothing prevents the runtime PM callbacks to be invoked
> until pm_runtime_disable() has been called at some point *after* the
> probe callback has returned. This needs to be taken care of correctly.
> 
> Likewise, as it's great with an example for ->probe(), it would be
> nice with a corresponding example for ->remove().

Good points. I've rewritten much of the Examples to now:

(a) largely *not* use devm_*;

(b) include a more interesting set of error handling and remove(); and

(c) only after doing (a) and (b), show an example that uses devm_*() to
    replace the appropriate error handling and remove() teardown.

I hope that will also partially address your other comment about
devm_pm_runtime_enable(), and how it's difficult to use correctly.

> I will have to defer reviewing the remaining parts in the $subject
> patch, a bit limited bandwidth at the moment.

Thanks for the time you spent on it!

I'll wait a bit more in case Rafael had other feedback, before sending a
v3 that (I think) addresses your feedback.

Brian
