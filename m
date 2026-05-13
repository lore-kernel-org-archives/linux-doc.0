Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBE3D5C06
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667005; cv=none; b=PvLW5mTW0i1AAjiwXaGWS6UsAGcERU348+H8YcFRaiI/iTZJPxKZ+CdNuEmDCl0t9fxGfOw4woDWeI1P6k5/ehC8PHbMfsZq2YeJHSTpywUTuFTeL3jSi5tfgfUv5XNFXEL+vfM4bcRlqR6w2CSN5dDYGoCpn6hZKe8wZLzqKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667005; c=relaxed/simple;
	bh=dI7Vy4tSt+ipoY1cvrv4SzZXvFAstFFCphZE2K3dz3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JprxdvYfFooqzxAixrU4v2cuo4g9i5VK1sVL3LUip5fJDBxqm2IDG4nB0iNViA8/sLx4WNprdUfCCakLiHK5+j6gQt8z3YApG072/ZQ/esNTe+lDm0OfwPgFzBQ5gbxQ2xJKf30pJlyOsFoXdv2u4FWy/kwMSbpHOlEuB4XDWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlFLZ/ly; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlFLZ/ly"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd2e8931915so284221166b.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666991; x=1779271791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPWJdSc2I6JXF+VrIjabBYnBXUVNyLPtG2ThRSxbw6I=;
        b=rlFLZ/lymCTUE59oMDF22xJoc/GrGrm86Zlf6fzn5pfdHOBtZYv5C5S7va59i5HCYU
         eDre+qhAloU5M3bjSi7iIn40fIgYw2PkYdDDQiOZtYtBeGSSVxlzfxO8NfpiFa9m55sj
         NcMoNt1vHhqltVi+sE0euhgDxgGSQadA5hB2YKgrV0XB0FsrJcDFjIPAsIwaeWxR4X7+
         /LTGVKsdHFKpTlXwGPyV972awoouVeOoxVhD5tEypphE8hQs4XPftOHVBYoRFmSHAkNO
         VwkPzoaUnnKBZGQv5qH/t1W+JvdxOBZ0VPh4cRq/rfIXP25Nvemg2wzoXjkG0kjAYnvZ
         f+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666991; x=1779271791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPWJdSc2I6JXF+VrIjabBYnBXUVNyLPtG2ThRSxbw6I=;
        b=LIkQ6N6aZXFSQ5sywucZCfYw79HQmtoXqeiGt2RXUsXzyyjL8R5icyafBMkpFqm76k
         owiAknfDYb+HmOyonrnaujf4Hq6V7ZPzaHHKZDZoLDTf5AsoQs4WWxbeCKbIAlCgkzy5
         TOinxRxAsEd1qvyfKfz+Txa/SCk+Njqa8SCYtFR4i7L5ZEJy97de+vye0bdCYxfENAVi
         HzXO7QhT2j2Nq9LPe42DxyWHTDFKNxPNZHFQUmswE7e5kGlfeQx6DbbKVfFLsQRgg5VV
         yuahyFEzVMN5lW2UCjX7IQOYJ6iUJN3Sr4F3rmvO+7C/xv52p7B/uMi1JHJrZ8nWIayi
         oxhA==
X-Forwarded-Encrypted: i=1; AFNElJ+SQIa3D3YUlBl2gAGFZvzB0SPLuBAlLfLml94ieUhtInCVFMTgiJEXRT8TfMGJLyJtt2oTSdIoVCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYPW+7URc/GT1kIwghgJwA6fvJwd/v3se7SV9GwBKkgafCI52
	ixg53zyzRiEQwPHroMxs4tBlGy3CeivlupB6SGJhTJqQ8WwwCTFzZ0zG
X-Gm-Gg: Acq92OGT1N2hI5Kr1qnrx1jIqL00/s7n8/Lxs5o40h+0X9BECISlP9sMXSk7/bLBLeu
	aJ7vcF7SFS9kAa87wJ4Qw0r1et3J3PAR4IczYmJUpBKWFu4sxiMcDmEp32DeWovQY2a2MVusan6
	O5XFsTP+TlO7Jl2rN5XoTmC00kR4UQWjHw/V2VUPGQnbUq9bTtf7iR4M8rfTeJGjMPh5BS//GoJ
	4pydJj8fLjqoiELM36KWovoDPhN2MvTrvxfzAp9IrbuKh95yE50x2lJzLHHvGuoN6nX4S4ijFrM
	3ZyId1FWxDAVZ6i4OU5mPIJlvJbAJvAVEdS9EoL1EKs1j9Ih3T9sAHj0nLTETs6LRl6IWOdCLcY
	cm/8VAwO6VQ1GL8qjjqMLxCXIWOJWM4HRcD8DCY35SJDguqBOIiTVoyuLLFnoNLErRAiuvKN9Ii
	VZyCxUleQnqC1OsvqXcaBCd6I+MXL7MuN5PKFVbb47aAuTM9NkSjQ44iC+MMHGsOWJv9WtHdE=
X-Received: by 2002:a17:906:730e:b0:bc3:99d5:a29f with SMTP id a640c23a62f3a-bd23aa18252mr420029866b.5.1778666989980;
        Wed, 13 May 2026 03:09:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb78493d1asm727760666b.39.2026.05.13.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:49 -0700 (PDT)
Date: Wed, 13 May 2026 11:09:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Rodrigo
 Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <20260513110948.16db5243@pumpkin>
In-Reply-To: <sqt72hd4xdu6rj3zecvcpo3bbfsxlh7u4bi76enbq64hpgjm3t@vksuk4cuo76x>
References: <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
	<CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
	<q4rmlkgecvztnvjg7b7wtqyvhdy7uxgaouvhae2mlsxaasasbf@dfakp4m5l5sl>
	<agNfqiZpGZAM-x_H@ashevche-desk.local>
	<ru2h3ip7qf6j54dlrij54nwp45uyq6m2e6zspt6v6eynpsagqq@eo5v3yparuhh>
	<agNnfWZa9_NyLoWq@ashevche-desk.local>
	<bc7mqfgll34vyaxdtvfssgypkhyx233wd4hxfzu32rddxnolaq@rd6c3z6yu6aq>
	<agN6onIAwG1yn5p6@ashevche-desk.local>
	<hvwyrb7g3ar7hzesj32zoxzqvjmdtwybamy4zxepqdbu37qvog@xnmgqhfya34f>
	<agOKq0iH2CHQ3TIg@ashevche-desk.local>
	<sqt72hd4xdu6rj3zecvcpo3bbfsxlh7u4bi76enbq64hpgjm3t@vksuk4cuo76x>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 08:14:28 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 26/05/12 11:16PM, Andy Shevchenko wrote:
> > On Tue, May 12, 2026 at 08:39:21PM +0100, Rodrigo Alencar wrote:  
...
> > Oh, I only now realised that this is sliding window for a single 64-bit signed value!
> > I was under impression that you wanted implementation that covers 128-bit signed value
> > (with 64 + 64)...  
> 
> So that was the initial approach with strntoull() with integer and fractional parts
> combined in iio core. At that time I realized that we ended up combining them anyways
> with:
> 
> 	val64 = (u64)val * MICRO + val2
> 
> so why not have val64 already! And all this made me realise that once leading 0s are ok,
> scale can be even bigger, e.g.
> 
> scale = 20
> 	max = 0.09223372036854775807, min = -0.09223372036854775808
> scale = 21
> 	max = 0.009223372036854775807, min = -0.009223372036854775808
> 
> It might be a sliding window of 19 digits, but here we trade range for scale, precision
> is still fixed at 64-bit.

I wouldn't worry about that case unless it 'falls out in the wash'.

> I have a new idea to make thing simpler, actually
> it would go back to what David pointed out in the past.

:-)

-- David

> Let me put this together...
> 
> > > I am not representing -0.9999999999999999999 as is. The desired scale will have this
> > > truncated. It may be -0.9999 or -0.999999 or -0.9. And this is practical for a
> > > reasonable scale value... for pico and femto precision you still get a decent range.  
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 

