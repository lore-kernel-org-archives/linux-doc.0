Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384771AB6E7
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296782; cv=none; b=fjnfLmWreTZ7HJx4+yaiYv4lempJxgN6kfUqRqU6g4jKKwyC6GxYApKCpEdPGeYkHY17AFJLhV8Kn5f44BEmSMypKlQ+P8uV1oy3tgcvMt6ueNYElPyRwtfdS79YapGUuBtUvJhPGMkY/7w4n/z1qu2qYEFnNGWDuHxhuxRlw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296782; c=relaxed/simple;
	bh=m/Hl05dGE8DG9LV4d7LMKZdjId9IkoBTCyuBgmslKIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFJaembas28DoOuDpDMYZHnxXn3OQduxINguhKvgbbHoV24fzkD6fbQKSEZMjtKBpv/FMUWNsVqEqo1KTonWbO4aBRkhGZQh5xAvE+7iuHixxssGM9yQNkN1Lmrw2qMgFpIPSEuMWjG4pA68BF55JQdSrZ9uc/uD53QG96aAIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=yQUXHPzw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="yQUXHPzw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8696e9bd24so516903666b.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725296777; x=1725901577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7M8BT8N6vTwP+D5Hjg4AMJAeuxuEG1WY11kk9v24ceA=;
        b=yQUXHPzwLakaHPlXkCRrO7aUae8f5P9dSXdXRoBhuFclC9S0bOMhP2XckKQIwQJY1G
         e+FgxkoxrD7MZED9W94hzfslKWzxVOwr50I44Lev2VSVriG/ZTp1gzQjxxKx82A7bXtW
         INwcl5qaPc4Qyq64vuqPBYVdGKiGziQd94m3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296777; x=1725901577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7M8BT8N6vTwP+D5Hjg4AMJAeuxuEG1WY11kk9v24ceA=;
        b=V03HsRf4GL3qNINiQElnKdhS3YK0IAp2lev6o/vBsadPjmH1JO2EYzucHPKs9FP50i
         vPmone8asqJ01DclLmc7+d3FkdRKYppWoCCkuNKpfhli9QuqYdbD1iipjcqn8IWcQRjw
         c+ic6Q4zLYFYvzpy1GYcnWboSA7Bs6DSQjFvyfk2wxCF9Jim9C1CJyDvEK7bfCZ8ikxn
         PxFSZD6d7rowIxdVAZqLKyeBgUJSEp/C8AoYTBUsXOEKjR15bjuvC2H2rT8SlDh5Hd3A
         euUYdx4Zql4Fwg85dio4LJzhxd24856KObiv0irc3k8Tcu7jrMlhwDQVBFruJGSbe+Iw
         sOQg==
X-Forwarded-Encrypted: i=1; AJvYcCX4JUi9A3oNjlV9A8FfSzQrgIWOYD7qXWICyNxfdHS4FOrnyFjRAAJs83znQJgVxFjk7wwyMUt7/fA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2S/KKoTjk71jh/KOK6GM41CCRJjbdJTDibb4lQx13EZncetC
	XndY+0PVRtO3Mvdpu685Rz0jo5Uk9gRpetJbksPobs+Wugo6uwNODyYhHVyfJDk=
X-Google-Smtp-Source: AGHT+IGWJf9Avan9MoUFQ6Ai0+z5nn+fJXzqwnGlBi2FTipYcSbwZOLN+wfh53hpdVGR9SMXe/vXdg==
X-Received: by 2002:a17:907:60d0:b0:a86:acbe:8d61 with SMTP id a640c23a62f3a-a897fa71c13mr1003988366b.53.1725296777056;
        Mon, 02 Sep 2024 10:06:17 -0700 (PDT)
Received: from LQ3V64L9R2.station (net-2-42-195-208.cust.vodafonedsl.it. [2.42.195.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989092143sm584447366b.96.2024.09.02.10.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 10:06:16 -0700 (PDT)
Date: Mon, 2 Sep 2024 19:06:14 +0200
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: napi: Make napi_defer_irqs u32
Message-ID: <ZtXwhnVzR6ofBJhb@LQ3V64L9R2.station>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240831113223.9627-1-jdamato@fastly.com>
 <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>
 <ZtXn9gK6Dr-JGo81@LQ3V64L9R2.station>
 <CANn89iLhrKyFKf9DpJSSM9CZ9sgoRo7jovg2GhjsJABoqzzVsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iLhrKyFKf9DpJSSM9CZ9sgoRo7jovg2GhjsJABoqzzVsQ@mail.gmail.com>

On Mon, Sep 02, 2024 at 07:00:48PM +0200, Eric Dumazet wrote:
> On Mon, Sep 2, 2024 at 6:29 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > On Mon, Sep 02, 2024 at 03:01:28PM +0200, Eric Dumazet wrote:
> > > On Sat, Aug 31, 2024 at 1:32 PM Joe Damato <jdamato@fastly.com> wrote:
> > > >
> > > > In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > > > napi_defer_irqs was added to net_device and napi_defer_irqs_count was
> > > > added to napi_struct, both as type int.
> > > >
> > > > This value never goes below zero. Change the type for both from int to
> > > > u32, and add an overflow check to sysfs to limit the value to S32_MAX.
> > > >
> > > > Before this patch:
> > > >
> > > > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > > > $ cat /sys/class/net/eth4/napi_defer_hard_irqs
> > > > -2147483647
> > > >
> > > > After this patch:
> > > >
> > > > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > > > bash: line 0: echo: write error: Numerical result out of range
> > > >
> > > > Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > > > Cc: stable@kernel.org
> > > > Cc: Eric Dumazet <edumazet@google.com>
> > > > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > > > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > > > ---
> > >
> > > I do not think this deserves a change to stable trees.
> >
> > OK, I can send any other revisions to -next, instead.
> >
> > > Signed or unsigned, what is the issue ?
> > >
> > > Do you really need one extra bit ?
> >
> > I made the maximum S32_MAX because the practical limit has always
> > been S32_MAX. Any larger values overflow. Keeping it at S32_MAX does
> > not change anything about existing behavior, which was my goal.
> >
> > Would you prefer if it was U32_MAX instead?
> >
> > Or are you asking me to leave it the way it is?
> 
> I think this would target net-next at most, please lets avoid hassles
> for stable teams.

Sure, that's fine with me.

I'm just not sure what you meant by your comment about the extra
bit and what you are asking me to make the maximum limit? I have no
preference.

I just want to prevent overflow and then make the per-NAPI stuff
compatible with existing sysfs code as much as possible.
