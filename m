Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A72ECD35
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757924844; cv=none; b=WdtfsjJBzuRIOmE7nCzFBwf2HeFQdS/49oAzkvSNht4ZYK85dfocKvCc+Ejiedq6rLLi58EAtXS9d3vutkoPKyHkKz/H3tufGyBRhyM75nz4bFjNYPFSuzp2GUyKPNieHruPYMGCIprq2ufAuVPh8TbZA6y2xBT/37ghT+lj+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757924844; c=relaxed/simple;
	bh=B5bFwfP2bCr2x5sdWdzgv78M8aq/SuMaso7S0SGdj6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ts7hkfGqFuR7zlAdx8N8jaVymL3HWqQT8GsHISgmtmEPmiu4hUuoJ3Jqunn4HXgLOfIwX/jP3L13+CH3rpYb7c6G9sxnx8ExUypcsonA/8X0JkoUiO5+2OxQmLMOlpKQpmJ9RD7A4K3f6EDjuC67QrQ1xuIkFOuZbsJYCSj4EIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7wnF/ts; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7wnF/ts"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so3100869b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757924841; x=1758529641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yC5si6Jajc8mcwRGIVQgOpJhXHjTKqr28jgzyeIoy8U=;
        b=H7wnF/tsLwga0mF2+aNGNuGWJinlHyDpIBQcaUxoD6PUWdovKZzri8gmzFthPWDsCM
         i2Nnn/YEBifI0OvR3s2WHjtlV7/AOm1CZiLhs4inwqibLJ/akMhz+vQfsJPhuHETn4Gs
         VkNX+oNfbN1ARkPkhHtrRqaoOWEIHBL6IOw/daJ8pdnAdpEfvAbV4/umyHC5AiNumJyC
         96uCu3PmB5Aie15K9GGN9c2QOkCl4i9j0NJkZKevRZGcRtjsb2oJiBBaMQK1q45HfP84
         V/qo61AW8F+ksy44uo26KWioCff3foILAlgjqYfQe2COoKYF0zmruDm8FDNr6S8fasFA
         29fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757924841; x=1758529641;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yC5si6Jajc8mcwRGIVQgOpJhXHjTKqr28jgzyeIoy8U=;
        b=hnkNIHgtR5lDFimPeJgkh+EuAAMSekU/pxC5Y/oMw/uFoIOHJbwpjqQIwNX9nQxZ0+
         MjcaqZmmBKzESHSIasb0AljuTArw531FSFMac/9JBEVOQopnrPGpuhlP4b5D7Z8Nz33q
         ZfRSxkjf+a0OEbrDE2XuaElR0MWAVfbeElDFhqBkoRFx8VpA/Bl8FaNRkRyh9dXRCTRk
         rXXvIW8oFDSpP3kIdNkMUoImcxKf8oUQ5p6sS06VhAObRwP4UyzeKv9lHqNM00dutUUL
         yahil4uFaR13SWBfF9Jajjh685YUyHfIqjoO2hqDLC+o0cZAHatIo4goVjI34vhlmvuU
         JNAA==
X-Forwarded-Encrypted: i=1; AJvYcCWD8u/sGSPGclur8N99IHmanxFrxQNGg458UG5MvimRZMCaH1P1PoQciR0JfDSYHfwGxkDH8ZIxpF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtEpey+tFQzH8lz23fI6gwyEeZIO4lS9j8Oao3L1MkbZO3Ny/A
	zptPSyrheESp7dKGsohQMGVqTyOyZF/vM2H/jRR1EH4rAGe1AGTsu1Uj
X-Gm-Gg: ASbGncsLgPbs3meBfI/q4SIPtlPmvBUt3PalP8NVrSWxvnVkLjUrqwFVCx877Is2r4T
	YgZWqPPV+J7russ8By0KpWj7YCJS92/jzYvoLG245Yqxu26hypSHUwhAALZ53LBol1Z9qnalqrF
	BE3GZ28HG3wbSQn90pPPpMXaOf2CJNhPEvgN1DZbAWyLaH4pGneId8fDnrRZZBHt7rzkBH60RrP
	mzuthQmvhYklwcofZsor3RKlhLXSbhqcIkcNyaWLEYMtZQ67yeKbSqxYuZmqy0NKtvh1t3aZF6a
	BfXwS9Hd4iMWl4Z++zGerYy61nCBeft8n1zLzj4UG0kilrIkUlB04M1zaQ5XG8B+kwxi4w/kzIP
	0bykPw2pL2+MSGS0Ageyge3GjO1nUYjpGOyDgdfTkZSKneIRni1DGxj57kBZWQ8CzaMsG
X-Google-Smtp-Source: AGHT+IGqg7ALC5A0bR8uakJgM3cdHBTYC+r3Djn6vd3EUgDlFtDywvAtxdkq7jMOtcsrZ2AgxgVp6g==
X-Received: by 2002:a05:6a00:1818:b0:76e:885a:c32c with SMTP id d2e1a72fcca58-776121959fbmr12367055b3a.26.1757924840480;
        Mon, 15 Sep 2025 01:27:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1a3fesm12749032b3a.56.2025.09.15.01.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:27:20 -0700 (PDT)
Message-ID: <aa2aa8d2-f7f1-4f04-a9b0-f08160f9ea81@gmail.com>
Date: Mon, 15 Sep 2025 17:27:17 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v4 08/19] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, jani.nikula@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tmgross@umich.edu,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250910153334.0b3e1440@foz.lan>
 <28c45f53-a3ff-428f-ba99-ebb09e0581d3@gmail.com>
 <20250912130420.6c14dbbd@foz.lan>
 <f3d142be-3980-4d4e-9d66-c03276694bf9@gmail.com>
 <6hhhn5go2yb7ecdrqtuti23i6pfgckqbdk5nhuhn2ijrhmvvmw@awswbm3tvmwp>
Content-Language: en-US
In-Reply-To: <6hhhn5go2yb7ecdrqtuti23i6pfgckqbdk5nhuhn2ijrhmvvmw@awswbm3tvmwp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025 16:50:36 +0200, Mauro Carvalho Chehab wrote:
> On Fri, Sep 12, 2025 at 11:03:43PM +0900, Akira Yokosawa wrote:
>> On Fri, 12 Sep 2025 13:04:20 +0200, Mauro Carvalho Chehab wrote:
[...]

>>> I saw it here on multiple distros including Fedora (which is the one
>>> I use on my desktop). Media jenkins CI running on Debian always suffered
>>> from such issues, up to the point I started ignoring pdf build results.
>>>
>>
>> So please provide exact steps for me to see such errors.
>
> Sorry, but I don't have enough time to try reproducing it again
> (plus, I'm ran out of disk space on my /var partition forcing me to
> reclaim the space used by my test containers).

There is no urgency on my side.  Please take your time.

>
>>
>> I don't have any issues after strictly following the suggestions from
>> sphinx-pre-install under Fedora.
>>
>> I even invoked [...]/output/latex/Makefile manually after running
>> "make latexdocs" by:
>>
>>   - cd [...]/output/latex/
>>   - make PDFLATEX="latexmk -xelatex" LATEXOPTS="-interaction=batchmode -no-shell-escape" -j6 -O all
>>
>> , and all the PDFs were built without any issues.
>>
>> Quite puzzling ...
>>
>> Or does your Fedora have some Noto CJK variable fonts installed?
>
> On my main desktop, yes, that's the case: it currently has some
> Noto CJK fonts installed. I wasn't aware about such issues
> with Fedora until today, when I noticed your check script.
>

Good. That should be a step forward, I guess.

I know you have repeatedly said it is not the purpose of this series
to fix those issues in your images, but I have an impression that it is
closely related to testing sphinx-pre-install, and the objective of this
series is to make the testing/debugging of sphinx-pre-install easier for
you.

But, at least for me, the behavior you want for "pdfdocs" is not
ideal for regular testing of .rst and kernel-doc changes in kernel
source side.  I want "make pdfdocs" to give up earlier rather than later.
It should leave relevant info near the bottom of terminal log.

Now, here are my responses to your arguments:

> In any case, this changeset fix it on several ways:
> 
> - A failure while building one pdf doesn't prevent building other
>   files. With make, it may stop before building them all (if we drop
>   the "|| exit");

Didn't you mean "(if we keep the "|| exit"); ???

If you drop the "|| exit", which will cause false-negatives.

And you are going to test every PDFs at the final stage of pdfdocs
to catch such false-positives.

Sounds like a plan.

> - It prints a summary reporting what PDF files were actually built,
>   so it is easy for the developer to know what broke (and it is
>   also easily parsed by a CI);
> - The return code is zero only if all docs were built.

I agree this is an improvement, but if we get rid of the loop construct
in the Makefile, we can forget about said false-negatives, can't we? 


How about something like the following approach?

Let's think of SPHINXDIRS="admin-guide core-api driver-api userspace-api"

In this case "make latexdocs" will generate

    output/admin-guide/latex/
    output/core-api/latex/
    output/driver-api/latex/
    output/userspace-api/latex/

They will have identical boiler-plate files latex builder would emit,
and subdir-specific files such as:

    output/admin-guide/latex/admin-guide.tex
                             c3-isp.dot
                             c3-isp.pdf
                             c3-isp.svg
                             conn-states-8.dot
                             conn-states-8.pdf
                             conn-states-8.svg
                             disk-states-8.dot
                             disk-states-8.pdf
                             disk-states-8.svg
                             ...
    output/core-api/latex/core-api.tex
    output/driver-api/latex/driver-api.tex
                            DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.dot
                            DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.pdf
                            DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.svg
                            DOT-289c17ebc0291f90ccaf431961707504464a78d4.dot
                            DOT-289c17ebc0291f90ccaf431961707504464a78d4.pdf
                            DOT-289c17ebc0291f90ccaf431961707504464a78d4.svg
                            ...
    output/userspace-api/latex/userspace-api.tex
                               DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.dot
                               DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.pdf
                               DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.svg
                               DOT-289c17ebc0291f90ccaf431961707504464a78d4.dot
                               DOT-289c17ebc0291f90ccaf431961707504464a78d4.pdf
                               DOT-289c17ebc0291f90ccaf431961707504464a78d4.svg
                               ...
                          

At a pre-processing stage of pdfdocs, you create output/latex/ and
symlink subdir-specific files needed for latexmk/xelatex into there.
(Copying them should work too.)

    output/latex/admin-guide.tex --> ../admin-guide/latex/
                 c3-isp.pdf      --> ../admin-guide/latex/
                 conn-states-8.pdf --> ../admin-guide/latex/
                 disk-states-8.pdf --> ../admin-guide/latex/
                 ...
                 core-api.tex --> ../core-api/latex/
                 driver-api.tex --> ../driver-api/latex/
                 DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.pdf --> ../driver-api/latex/
                 DOT-289c17ebc0291f90ccaf431961707504464a78d4.pdf --> ../driver-api/latex/
                 ...
                 userspace-api.tex --> ../userspace-api/
                 DOT-1e98886fceca6e25a115532f5efebb44c09dc98b.pdf --> ../userspace-api/latex/
                 DOT-289c17ebc0291f90ccaf431961707504464a78d4.pdf --> ../userspace-api/latex/
                 ...

The latexmk stage would now be identical to the SPHINXDIRS="." case,
meaning it won't need the loop in the recipe.
Furthermore, post-processing would be almost the same as the default
case.
 
As a bonus, "make -j -O" will work as the same as full pdfdocs build.

If you are interested, I think I can prepare a PoC patch, probably
after v6.18-rc1.

If your sphinx-build-wrapper's latexdocs stage can be adjusted so that
said pre-processing of pdfdocs can be made unnecessary, that would be
even better.

Regards,
Akira
