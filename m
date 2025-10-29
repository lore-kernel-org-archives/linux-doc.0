Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1802641C6
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747651; cv=none; b=euEo7etlofuSOBqoKrueDUYkGuInhCynHS9NYLkj0AgXB2ZTzna2w4s1iXco4QYa+6npNHBP74U4m40BZdEDGMFfezeRTTpMIJ06oH6GPVjIBB1pWpXajD4mfXQAVV+YnbJyafeDGONGZOyS8Uev/V0MU4W79ipyoOak5ix2X3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747651; c=relaxed/simple;
	bh=am0/YbY3X+EDDZcjCgeLwrDMLb2LpBxcjmr3MpjYeF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS2IMLaHaMZxUqT5UrUXBop4X9y+bx3hAc1ym5NFD8cnYtCWzTK5GQ8UXP3dWBWY9mjiWHQvdXeDxstOl7+LlMMPnFCQZRJuXxcG94obOyjRfBF/0OnIb1oxJEelhI2KwWCQgUug7bkG9yMZ+u/FvwX2QvGz8XBC0DZ9uZb8pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=e4qAsRXa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="e4qAsRXa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-427091cd4fdso4263255f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1761747645; x=1762352445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxBr6UEJhfUdxptPH87yDMGfOKWl61gBXcrB5pzrHm8=;
        b=e4qAsRXaZCN0Ac957vNDchZDWjuVxpaJLnRYPl+nNoiy10L0woLP3nsMf2HqatRMTf
         4yxKeUg/oDlk++HNyvAw3tDqui8UMe7vm/yLSUA5RPhm3XIs+TJ8WJ9LhrN6NSoGVA4B
         uBYyiaNFqnCYFmgIzqu0+kW+gS0HXQvrO+Oj5hLJb5n+8GPeyuzFsQkcAfWYd2N9zioF
         Bn5Cf38/ITDlzCB+teSgsbPIEu4lAhRjkHzcCqa+bWPFfVRvvomfoL2Ztj6bc+uFkzmG
         Ttt//U3awXwdxpFkE6JliMARy8fAnEf3AW7BywgR+D7FNYhTotOaUu6eKcv0RE1BCL+2
         3VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747645; x=1762352445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxBr6UEJhfUdxptPH87yDMGfOKWl61gBXcrB5pzrHm8=;
        b=Y+0ITq88pK0QFCmkCDMuOim23zmb7xcUvHf5mB5y1UogmAlX1QO7vS4Mx43CXeM406
         9N3D2Q6gn5Nl/mrBeZFWb5ejCoSQlgV7aiYoxfz26S7Ef6E9+y0PmcuFXgoLINfWh7GT
         o1rTcoXzgArEabCHTz2y8UCS8FNxKmFA0jlK2hR/xtqOHtCJg5nBqVAWVZcV4+BdtqEs
         OL7mBU+558uXiULC6ufpS0uY1t9/aqA5rZlDJG27iamo9QAZ5keHnCBCSiJdNcy9Oc3R
         4J7nHiF3vsgabxvxoDdyj58NH/pZbI37rRqLOI248UmueIY/XiuC4THXontnyZ+88rxA
         eMaA==
X-Forwarded-Encrypted: i=1; AJvYcCXpw4SmhxPiRQgiqHxTul3TVIpDC2uzH8lOguhsUDAUi3Jw5aKUnAK8bSO3G5bPyjRWiwLx+kFkyBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHwljVSBnX2o1rvCyaCUNzw2ePrewU0KcvdVzcQ5eM5CL+SCt
	AIzsjCNKAX0rJhBEGecxHxSk5umtXOL0TR3ojrObfM7tDbjQbCTEPTX3vud+jOIyYWA=
X-Gm-Gg: ASbGncs/d/xQfx6kmHiAPtKdpo7f9yDHclMMag9qs26orgY+5CZmZbOU6qIkk8LMD59
	MQsZ7vzNgBPd14V9B0jpiVVUtkFhaYawRtA4xm0vYBbp6lamvo7HJBeBepEys+CSd37JwLK7qil
	hgw7LP6e34AkK9rXBJES/+Lzy9tdx6stHgGLYhGugn0xVlmkjs1icy8YzM7LeJ62o3tmeq+Msmg
	qqxJkyItM9epULJPHiHth0Ss/UQIFLE0GvwdPapJNkxxWn96FeCroQBupzZ/6BRgHlft4IxP1o7
	KFLCT58y9og7tsE8OvIWG5gpa5nS9gri6RSFiZfWiFbCqIlFEunf1qOClA6KmTcpGvxqpBkDM/c
	nstgjcQKq5UAX7jliAfpgXm0UMzqkWeIAZNc4bSCAQlMuwTRZCuTO5eP1SKAubHFLsZVT2YmN4R
	Fy6fJA4zK50BEbyqye1WaX37wW7Fs=
X-Google-Smtp-Source: AGHT+IHoQJVW3GVryEUbRFPGpnxQkJbTH7OhYAuA7LrZ0+OT2N5eQIcCT1zPMqYvJ4arflxQltQRlg==
X-Received: by 2002:a05:6000:2001:b0:428:55c3:ced6 with SMTP id ffacd0b85a97d-429aef82eadmr2390550f8f.18.1761747644972;
        Wed, 29 Oct 2025 07:20:44 -0700 (PDT)
Received: from jiri-mlt.client.nvidia.com ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb20sm26388404f8f.18.2025.10.29.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:20:44 -0700 (PDT)
Date: Wed, 29 Oct 2025 15:20:41 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] dpll: add phase-adjust-gran pin attribute
Message-ID: <jgebk37r4xs6w4526hjc5u6r7oudanb5ce7v4xlaw2tcswtycx@cvmxkwxvkpek>
References: <20251024144927.587097-1-ivecera@redhat.com>
 <20251024144927.587097-2-ivecera@redhat.com>
 <20251028183919.785258a9@kernel.org>
 <b3f45ab3-348b-4e3e-95af-5dc16bb1be96@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3f45ab3-348b-4e3e-95af-5dc16bb1be96@redhat.com>

Wed, Oct 29, 2025 at 08:44:52AM +0100, ivecera@redhat.com wrote:
>Hi Kuba,
>
>On 10/29/25 2:39 AM, Jakub Kicinski wrote:
>> On Fri, 24 Oct 2025 16:49:26 +0200 Ivan Vecera wrote:
>> > +      -
>> > +        name: phase-adjust-gran
>> > +        type: s32
>> > +        doc: |
>> > +          Granularity of phase adjustment, in picoseconds. The value of
>> > +          phase adjustment must be a multiple of this granularity.
>> 
>> Do we need this to be signed?
>> 
>To have it unsigned brings a need to use explicit type casting in the core
>and driver's code. The phase adjustment can be both positive and
>negative it has to be signed. The granularity specifies that adjustment
>has to be multiple of granularity value so the core checks for zero
>remainder (this patch) and the driver converts the given adjustment
>value using division by the granularity.
>
>If we would have phase-adjust-gran and corresponding structure fields
>defined as u32 then we have to explicitly cast the granularity to s32
>because for:

I prefer cast. The uapi should be clear. There is not point of having
negative granularity.


>
><snip>
>s32 phase_adjust, remainder;
>u32 phase_gran = 1000;
>
>phase_adjust = 5000;
>remainder = phase_adjust % phase_gran;
>/* remainder = 0 -> OK for positive adjust */
>
>phase_adjust = -5000;
>remainder = phase_adjust % phase_gran;
>/* remainder = 296
> * Wrong for negative adjustment because phase_adjust is casted to u32
> * prior division -> 2^32 - 5000 = 4294962296.
> * 4294962296 % 1000 = 296
> */
>
> remainder = phase_adjust % (s32)phase_gran;
> /* remainder = 0
>  * Now OK because phase_adjust remains to be s32
>  */
></snip>
>
>Similarly for division in the driver code if the granularity would be
>u32.
>
>So I have proposed phase adjustment granularity to be s32 to avoid these
>explicit type castings and potential bugs in drivers.

Cast in dpll core, no?


>
>Thanks,
>Ivan
>
