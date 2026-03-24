Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39A3F7876
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352944; cv=none; b=EAyP/XDYya3DKA1thsozKsyQj0A09A+UjOQeQ3GeTwoui0s7l/OHcLrL6NxnIGu3lp3GCvavXS1ECLT1S1wMW8oc/c1q0deFa7u9T3jfM9Z7cG66Si/yrm1k1VkHlG0aI8FPb8fJjd+6kcQwOO+Tl0tFusezaj7Cch060S+v/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352944; c=relaxed/simple;
	bh=rjdlh7bfjjpgPBB6MBM48+VIQFySi0/2bBYsnW/0rK8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=m7giCvPtCHgiOrpl+8kU6uimzSwZweaNl6e+ljsmIy18A9DSPl3/v1CTGfr/0nmikf9b2kdJ6ap7JD+8qHIy1joViU2KOvxuKOsnk249IRYc7tut+4fiuO8jb6GjiflY1IZpZ7GTUb0YRCzLrxCEw/WGSrVNlZyuEpZYS/HkJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHA0uio7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHA0uio7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35bb9070644so2359008a91.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352939; x=1774957739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOmnOvJidcot6jxLrH1u76JLYVqpj1sXzmwoS6+GMMY=;
        b=BHA0uio75PXHnR3qYdzl7LNQj7JXYtX0vUUq3m0U2mUnoJizXkePNioU1tc08SEdCw
         nN9PNH0+YkFDxUEz2xTaa8OGkt2su3yeUGMcQkYpOo/UggBdzFRT4fo4SKuRLYhv9Fgi
         JEsEIPiIaw2Aq0YxZtMn3h8IeZTNV4i48rCZeSn/LWyHugJfWwSYaSCgENC1YOkTqSGL
         a2v6Gh/IhOpZn9oNFy6nFidRwh9pfdb2JrIvm1sgYAtgFFTRiGdIJWKd0GoGqE90yujc
         Zaeexn3O/uvlN1Rq0PYbSdGOX2+iITgMtPHZMa81WNE9U8v8mvbO59H4bfjvXpp2VKoI
         ZX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352939; x=1774957739;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOmnOvJidcot6jxLrH1u76JLYVqpj1sXzmwoS6+GMMY=;
        b=k/hCB8MWkmVUGONtnYLyoLA4ylx1kvVj9HxlKicBmvWdm616H+FlFadIl15+jMQ+ff
         bTIBJ5NSGHEL2IQTS8kpY3pUTcYjxMYCKA+zZ2Gcv8TT1m4cpwOsh5DBbVpvacHZSk+C
         c64AwiOcySobY4FDRniLtsH0OtlLW5+Ky5IbYZSh0JsIrzK+ktDSmWeKsusC9cd5qrEb
         kCo1CmutOjtJBixOlwu53RwuW83U1F9fDl6W1kLTwehU0ck/sb4JNpFCkZe8a7+YMoNj
         MA+xt644K2ybFk7kHvYs1PTRVkSXcjh+jElXaMKLGtmXWwD1ispFHwfBgfr/Xb9Dcfal
         fDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUsrLXn/NymoEFewroMKdAwJzmUtFQYy9glhhLYsToFAXvwdD+je8uhAeHjlkXcvUwbA7HzdDIIag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyky3GpvxAQWzlEjzRODb74/DbvoRf6YqmkDRwyjtdl11MJBqK
	vKLe7YSW/R7n51fVd/W+Ei8ZQpdPdk0pRdgV0E/9cLf9Tl56QbDULkKI
X-Gm-Gg: ATEYQzwUyX/ExFlKj27x7Hku5QcEimp9Hh6e5K7MgF8SvhMBHfMgDBNSc08rJggs92L
	7pmJqZbsdEw8+/AYw9cQYiK1I/EPCal4O1Z2UiwU3OL2LHo7X+CMKWRA3m807rNdRnrBFLLmIv8
	3drIen0xXHWTrk8PnlKnuYhPaUueFhNm6Q0fLoi4xdwPIjmgKN+ezr6eTjsSt0hqbhn6pkKj2Im
	7VN2KKHFGIhU+UK78HpMVoWgja5VlghJp7nbG7CXV7HTXQLCUyBt4cxNIXw1y8bqr0RvV/UtX5z
	CUvAWNaR8IDz1YvRLPfFvfdZxeATzP7TkCrHtCw0PjdlBo6Lfkg92DpGMLjf5bQdrnerkMZfUiK
	Lx0cfve6PzylKWLsrKuLUb1e6sv3Tw2KiQnhB6J20ZjCf/ZW/V3IGQFielYBgI89vdRpZXlZfD9
	Eo1vCg0KBcaW42+DX5Bcfgh0/7jhjNBKRFkNLHEcE/u8kRZckxuVVJe5kyypgKpta1uBGU
X-Received: by 2002:a17:902:e54a:b0:2ae:825b:49a5 with SMTP id d9443c01a7336-2b0825bf592mr154385155ad.0.1774352939359;
        Tue, 24 Mar 2026 04:48:59 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a31ecsm143127965ad.77.2026.03.24.04.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:48:59 -0700 (PDT)
Message-ID: <2ceb291b-3b18-43a7-9d51-5c752f1eebf4@gmail.com>
Date: Tue, 24 Mar 2026 20:48:55 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: leitao@debian.org
Cc: akpm@linux-foundation.org, corbet@lwn.net, kernel-team@meta.com,
 linmiaohe@huawei.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, nao.horiguchi@gmail.com,
 rdunlap@infradead.org, skhan@linuxfoundation.org
References: <acJh0Sk4UdjaTFLh@gmail.com>
Subject: Re: [PATCH 2/2] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <acJh0Sk4UdjaTFLh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 24 Mar 2026 03:09:25 -0700, Breno Leitao wrote:
> Hello Randy,
> 
> On Mon, Mar 23, 2026 at 09:51:55AM -0700, Randy Dunlap wrote:
>> On 3/23/26 8:29 AM, Breno Leitao wrote:
>> > Document the new vm.panic_on_unrecoverable_memory_failure sysctl in the
>> > admin guide, following the same format as panic_on_unrecovered_nmi.
>> >
>> > Signed-off-by: Breno Leitao <leitao@debian.org>
>> > ---
>> >  Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
>> >  1 file changed, 27 insertions(+)
>> >
>> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
>> > index 97e12359775c9..3310fb8272fb9 100644
>> > --- a/Documentation/admin-guide/sysctl/vm.rst
>> > +++ b/Documentation/admin-guide/sysctl/vm.rst
>>
>>
>> > +
>> > += ===================================================================
>> > +0 Try to continue operation (default).
>> > +1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
>> > +  machine will be rebooted.
>> > += ===================================================================
>>
>> The table begin and end lines must be at least as long as the text (may be
>> longer). Please extend the =========== lines by a few characters.
> 
> The HTML renders correctly in Sphinx (likely due to automatic column
> expansion), but I agree the raw table format should be properly
> structured.

Just to be clear, Sphinx is behaving as expected here.

The table is in the form of so-called "simple tables" in the reST
(or docutils) parlance.  The rightmost column can exceed the width
indicated by "==========".

Quote from [1]:

   The rightmost column is unbounded; text may continue past the
   edge of the table (as indicated by the table borders). However,
   it is recommended that borders be made long enough to contain
   the entire text.

[1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple-tables

So, it's just a recommendation, rather than a requirement.

"Grid tables" have a stricter rule.

Hope this helps.

Regards,
Akira

> 
> I'll send v2 with this corrected.
> 
> Thanks for the review,
> --breno
