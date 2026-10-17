Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF4305692
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197288; cv=none; b=ueY9Wyrnao71ZmNOxxMooa/6d+kneaUe4H9XoBl+BKdlThUF5jn/prl6PXNN0t4NPwoazOnPkWNsMtZplrhtnREKrw9dxikbrmeChNVGArgB71XUHoidqBJDjB+b5re5Kk2U7PEPSZcYCj3R7qFzkQkQyKyh+DSdL85O/GgP0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197288; c=relaxed/simple;
	bh=Uysk2PPsTqzTyTiZaUpbdBbNf+bTXc4rWQb7gKDcOII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI83r2/vGjXZEJz20HWE1t0VqXHs8qqDLwrmSqxjRzmqhqxwpD43e2vgxg5H63dpJTut70IUGgh+7GXtiSlwPIZgAMiun/Txp+369mxNIRMNvVQhpMVzOLBPVfSCVWxoITmvHo8FAmn9peL2zzHhDzp0TEe/Oaxgd4BLAKB8amo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BtwO4AKj; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BtwO4AKj"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso558653eec.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792197286; x=1792802086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0aepwILCIIPYy/3iG8trIfjCcCal604FcoCtw2lWda0=;
        b=BtwO4AKjWNCU7Olm6QXFGmR12/0ZFzpxy4YyOeyWcQjd7zO7nnVw5JJ9HpZ+N8vsou
         FHN5QDMYvGo68wHHAZoEZsHyJ6BJ1OSQVRkKH7sNwMde3AaRrzcvVaaM2/ObGbRq6+sc
         tOi0ySPl+1PKz4YWj8A4zIeJLrjPdfxqwNr5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792197286; x=1792802086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0aepwILCIIPYy/3iG8trIfjCcCal604FcoCtw2lWda0=;
        b=hRGdrBfmzaWoSW+NKgJcaXAI0VRtBPt0PDMl7BfEek+M489GfIY+obMxFZiNyUc5O7
         EqgUDKh0rDv/hzK37RUwO7T9doXOsvZji/Ezm7qzBHlJPXNSojfXoLGtOICmXC8hcwaA
         idvHOoejY2of46MOAmH3qlcqu387eT/mLx3UcZC+BqCGJGCYe3VguhgcMPiWnZzy6neD
         WFzzt65GgP/qvKdvTCLmwG9r3E1GorR8KcEAzwTwGmZRjWlRs8j287Gqmi/SobdFEg3R
         XRoLEdDfC6hcev6p17JzJlWVtfDCrThig2TtBcS4QlX7fj0kiAMM7vSAgeiO2nqf9V9R
         8VFw==
X-Forwarded-Encrypted: i=1; AKwUvByaJ9aph5HxsuKgk0cyP/WRbth2zlfJAzm8nCnm5LgLVD6VP07VRYd5PO5UnfwdZW1fEBsiW9/uPko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxcJJ7Ir36ZzlXGnt68VqXc3j+ZX7jFVg6OtCHDfN3nT3jOiaz
	hB6TvJQoclENmo/pxbku0gSZ0RF7Mj490G/MlEG0tUBv2Au/fj9J+SFo5ecI/Y3wmA==
X-Gm-Gg: AYBFou3/CIuiNTIFvi4cIuvigwBVAANjiY+0SWnmvcKgOBNeBVx3hgtJ11ZQ1mmGKrn
	RTPXrlB7MViL0naWxnW8N6kVC/xTsLL/apfEF09Y/N4UbDcDgZseBIImNxwIxytYX0Scs2HVYZU
	xPCy/j31ShrB8y7jp0qRMDO2t+cd2vAtlAbq6byTmoTb9dHD9DmeSAjLwcM0q5EaVuqb8bqaVFw
	P03J+r7gEGHeaC0FVOt/hO7wE6LEdSiu0s5AdjK1CO2KOC9OF+siBBQcrX8zCU8NNbVoXM+Rj+u
	q2D9nSNkCYhm0XW7jg3wJ666KXu6VBi70yfPXb2XmzA7UU+IptSECAmROulhf72Zc8EWppenCNy
	Ku/SmA9uA58WsGIQ1gBxBxwpYk11I3VaRvg55H4syyyxgkRG6R9ryfSw1YCTq5AHm4MeL/aFdtr
	gaCI/u/OtTgORBl1N0bh8ceMllL9LPNNdoP8oWGHRLNNONSKrH+uRjC7fCiIJzbP1XGFrHZRJx3
	vjSiG7362mKDsnvcmCgbeL8F+2k11Qe9CLx
X-Received: by 2002:a05:701b:4582:20b0:184:19ee:1fdd with SMTP id a92af1059eb24-1850d370592mr1903173c88.5.1792197285806;
        Fri, 16 Oct 2026 17:34:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:d542:736d:a85:f140])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1830f213ba7sm10311484c88.0.2026.10.16.17.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 17:34:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:34:43 -0700
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>, Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH v4 2/2] PM: runtime: Add Example Driver Patterns section
Message-ID: <atLCo6LyUmepwg4r@google.com>
References: <20261001155118.1750028-1-briannorris@chromium.org>
 <20261001085009.v4.2.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAJZ5v0hMHutu69acgSR7KsmcLs0McZK+-3OFoiqFrU5GnJzTNQ@mail.gmail.com>
 <as_i5MEz3WfnDQmf@google.com>
 <CAJZ5v0i+77gt-KmMYdxxzS4uGzxFArrYGpoDnjrfknpPOkAuHg@mail.gmail.com>
 <atE9urIHXAJZXu6k@google.com>
 <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>

Hi Rafael,

[ trimming the rest. I appreciate the replies! Will respond later in
  this thread, but largely -- ack. ]

On Fri, Oct 16, 2026 at 07:42:47PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Thu, Oct 15, 2026 at 10:55 PM Brian Norris <briannorris@chromium.org> wrote:
> > On Thu, Oct 15, 2026 at 10:11:04PM +0200, Rafael J. Wysocki (Intel) wrote:
> > > On Wed, Oct 14, 2026 at 10:15 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > Would you be OK with pm_runtime_force_suspend() as an alternative here?
> > > > It seems like some drivers have started using that in remove(), which
> > > > doesn't quite match its docs, but otherwise seems OK to me. I was
> > > > considering that already here, and I even think it might be a good idea
> > > > to do automatically in devm_*, as I noted here:
> > > >
> > > >   https://lore.kernel.org/all/arVWVA3lks7SopQH@google.com/
> > > >
> > > >   (note: there's definitely at least one typo in there; should be
> > > >   !pm_runtime_status_suspended(); and it needs some other adjustments to
> > > >   actually verify the device was suspended at time of enable(); ... so
> > > >   consider it a concept, not a patch.)
> > > >
> > > > But I kinda wanted a maintainer opinion before I went too far on that.
> > >
> > > That shouldn't be necessary as per the above.
> >
> > OK, yes, not necessary in this particular example.
> >
> > But my hope is that devm_pm_runtime_enable() can be made easier to use.
> > It would be nice if we had the property:
> >
> >   If your device was suspended (most resources powered off) when
> >   devm_pm_runtime_enable() is called, the PM helpers will suspend it
> >   (power it back off) on remove().
> 
> I'm not quite convinced that runtime PM is suitable for devm_ type of
> management.
> 
> IIRC, devm_pm_runtime_enable() was introduced to avoid some code
> duplication between drivers, but I don't think that it may be expected
> to be universally applicable.

I also don't think it will be univerally applicable, but:

1) it's reasonably widely used. (220 and growing.)
2) it's commonly used for "simple" drivers.
3) those "simple" drivers still often get it wrong.
4) I don't see a major downside in trying to improve it in the ways I'm
   thinking.

For #3: literally the first (alphabetical git grep) use that calls
devm_pm_runtime_enable() without first marking it active is
drivers/char/hw_random/mtk-rng.c, and it has a bug -- it doesn't balance
clk_prepare_enable() and clk_disable_unprepare(). In fact, it performs
no remove() action, because *normally* a simple driver that uses devm_*
for everything is automatically in good shape. Everything will tear down
in reverse order, correctly.

But runtime PM is crazy, so no, that's not true. Runtime PM allows (via
.../power/control -> on) the device to leave in an ACTIVE state, and for
that clock to be left on. I believe if the driver unbinds and binds
again, the clock may be mismanaged forever.

I think a simple driver like that should be simple, and we can make
devm_* + pm_runtime work correctly for at least the most straightforward
of cases. Is that an outlandish goal?

Brian
