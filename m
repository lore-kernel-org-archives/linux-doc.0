Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D023CCA02
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269018; cv=none; b=rAHGvg2YUJVpyES5qgSB3hvcdt89cAZbN++bD7K0NCHR1yHjZolRVQl6RNJ9hUu0dMqLSr+ygzXOYixRTkcQ88IZyMXQT3n7UEIKJu5mju1PdajnGm8x5fEj9Gvq6zSBn9nddUhxF/c9yKF/Q94Komy8RCk3CTDESu/Zmdz5YJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269018; c=relaxed/simple;
	bh=WYqlHO/zHt3Xutv1rUCfQfMjfWFxGbA6/KjnOWjFWrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMowR8MgGgQkt/8mh1hGe/19t62hF1SFQJOiFWMColsVOExEjmTF9NrwOFMZw0vkh3eoNFKt7FoWbXRY5L7JqD4yedM9kOFRHZ/XjF1VtK80fvNKDLwgaXbj4gRdBacoIos24Jdzxe14K6DaLwlpy1Xr93sWJSJAts7zvU37/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a1xQSuLj; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a1xQSuLj"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso83610a91.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790269015; x=1790873815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guLOIkoVPSN8vWBIel9PXHqx3VExrGAEcv83cGNA/Jo=;
        b=a1xQSuLjoOkO2ZAEZH0MOvWI/GDdI3xIPFdyQolWJku5WeZ0NR6OsSYE33kyEsWAda
         ABS+PpnD9vk6scQUj8PAqUoYhreuZ+5XvuakClTpfyRSt5FYjmnXUegK/rFOSKevkmUh
         A7cSm1x6gjQ78uOtkyWXid6hu9ze5A9UEP9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269015; x=1790873815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=guLOIkoVPSN8vWBIel9PXHqx3VExrGAEcv83cGNA/Jo=;
        b=PAJ6RUoQztAU45dveJzfMz64uJh5iYtNW/VZX/8IQ3C6cVkOhjnYS1Alv8BV4yTyKt
         30dR2mJ1NG6Y1d0bV6Wp8RN2wCwqPgXqTSOAwkwZ6O2u2ySJAAc+2XvU7R47V6TnWyDB
         20kzuUJqZSKSoOXTnCeYS4x6qRYRfNEev8cudu1Hv30Qdj6nb5ZFlp+AyeZXSCa5HBd/
         S5MQSpRNcm36QHyNEkEsBMWPeA0+AI+B874FyGvXKT45kFVrem+cA9a9yGtpXR/dQBez
         VcoT8viZiJ5CGpBKsiNJzPwC5ZqOpkg85S0jQwzT5OCpfaf3pHNTjh09O1C9o7L8L9Vm
         fqNw==
X-Forwarded-Encrypted: i=1; AKwUvByUFUU9yJa/uBw+/RR2eFKfCCFVqYW7oqWxgE+Qm6f6Cqh9FIXEfC+GlNpu/voQFcyMLxSVWGZ3Afo=@vger.kernel.org
X-Gm-Message-State: AFuF++nTduh3RhP2ULFPtywN7DkAnY41W3BCc67vgZg43r4Yw9Z9vjyC
	yRBpXwwmykHT33jZyuz68z2HOS5GiLljxTYlr7quuzyZN/uJT/gnbc3vq98mmyVx+g==
X-Gm-Gg: AYBFou3bMWV5n6JNL4Ju4w7W987ciLaDw1Bxi6dJ3CjUIkmlWeis2OZYq/8eWV9cByJ
	Mx1mszEVebqwbiveEAz6uo65SLS+fJFJYlcwAqciN9p7LcUHiUYuU5hey+tbZnReQTq8RWDbmZh
	VCYUtN1xZpc3xHHlijJrqiimSXEavFYTZXyo1cyiaE4PkphxhPqcFuzeiM3Ghj/9rw/EfzyptQL
	l1QrBI2knKgBSpmvMdbEVzHylIqr0A0QPgmfH47E4vfz0a5omYT9hLeg/NaD7yTUeZea5yA7UxI
	P3uAER7bwhdUTqzJ7f99NNsS4s/6SIt4QARXvZKd5vVGX0pODbLpiTaYAC0uRWx0ITWl1E+wfA3
	Fd+JuXrJqoXy3fUtncsMPk9ZzziHHNYGw9d3v1NmOkRutFyy7STu2rIaYFpAFp5MUXzQBn+OyLC
	lYBXcuntUtkBI57qwvHe+uQ96s64BF3fy6HvORXWrzx2KES3aj5WE3KF9uMMbl0pW8CkskmX40g
	Y7pAVY+Rou1I/wkM5ufvcA+iENshpJ+ArtsIw==
X-Received: by 2002:a17:90b:4487:b0:39e:6c69:9b95 with SMTP id 98e67ed59e1d1-3a09928d05fmr2500373a91.58.1790269015076;
        Thu, 24 Sep 2026 09:56:55 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b9bb:8d53:6635:9f5f])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc78794331fsm42561a12.20.2026.09.24.09.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:56:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:56:52 -0700
From: Brian Norris <briannorris@chromium.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
Message-ID: <arVWVA3lks7SopQH@google.com>
References: <20260923174711.1283986-1-briannorris@chromium.org>
 <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
 <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>

On Thu, Sep 24, 2026 at 04:01:00PM +0200, Ulf Hansson wrote:
> On Wed, Sep 23, 2026 at 7:47 PM Brian Norris <briannorris@chromium.org> wrote:
> > diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
> > index 39fdeeda7a1e..352cdaf0650d 100644
> > --- a/Documentation/power/runtime_pm.rst
> > +++ b/Documentation/power/runtime_pm.rst

> > @@ -315,7 +319,10 @@ removal of their drivers.
> >
> >  Drivers in ->remove() callback should undo the runtime PM changes done
> >  in ->probe(). Usually this means calling pm_runtime_disable(),
> > -pm_runtime_dont_use_autosuspend() etc.
> > +pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
> > +devm_pm_runtime_enable() during probe, which automatically takes care of
> > +calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon driver
> > +detachment.
> 
> As I have stated in earlier discussions at LKML, the
> devm_pm_runtime_enable() API is not entirely easy to use correctly by
> drivers. It means that pm_runtime_disable() gets called at some point
> *after* the ->remove() callback has been invoked, which can cause
> problems, unless the driver's ->remove() callback has managed things
> correctly.

Yeah. And I think it's rare for drivers to have done a thorough job. A
rare exception: I found commit 2d90ecdfa326 ("ASoC: rockchip: i2s: Use
managed hclk and runtime PM cleanup") an interesting outlier -- it adds
an additional devres teardown to power things off afterward.

OTOH, between v1 and v2, I chose to tweak one of the Examples to avoid
devm, precisely because it was committing (or hinting at) these kinds of
mistakes.

> My point is, the above makes it sounds like it's easy to switch to the
> devm managed version, while it certainly isn't that straight forward.

Right, I said as much in the cover letter too:

(possible future work)
<quote>
 * Adjust the way devm_pm_runtime_enable() works, specifically for
   remove()/teardown. Currently, this is very hard to use correctly --
   some common driver patterns may assume that a device will tear down
   while RPM_SUSPENDED; but that's not actually guaranteed. Notably,
   this makes some of the "Examples" section fairly tricky/subtle.
</quote>

Would this be a good moment to pass this possibility by you? What if we
taught the teardown to force a device back to RPM_SUSPENDED? Something
like:

    static void pm_runtime_disable_action(void *data)
    {
            pm_runtime_dont_use_autosuspend(data);
            pm_runtime_disable(data);

            // New code:
            if (pm_runtime_status_suspended(data)) {
                    int (*callback)(struct device *);
                    int ret;

                    callback = GET_CALLBACK(data, runtime_suspend);
                    ret = callback ? callback(data) : 0;
                    if (ret)
                            return;

                    pm_runtime_set_suspended(data);
            }
    }

> Not sure what that means for the documentation though. :-)

Well, I don't feel like the part you quoted is a problem. IMO, it's
totally fair to mention relevant APIs even if they're hard to use --
there is no part of the runtime PM that is easy to use!

But I'm definitely trying to make things easier too. Ideally, we can do
something like the above to make it easier to use. But if we
can't...well, I guess I can try to document pitfalls better -- possibly
in the Examples section, or maybe an extra note in the above quoted
area.

Thanks for looking,
Brian
