Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676620;
	b=n5ptMV0Z4Eowm9ZU1kMNaHcEMYaxhuVJNm+HO0Yk1TKNZIDu0Bu7rhvtWaeaAFizW38b
	 elk1p8h1Yv3Of3RkQd4G5mnciLiiha1syOHSAx1CfSoPgjVX5A9BUGBZblkynRVgq8+u4
	 IoLl+54MHqx0F4qPy0BrJ9s2yI28nEKE9wE9Qt3wdXOt8O5RJ6dotgjktX+/6Slr4Cv2n
	 9q3RzRsAXDFiyquHm6K9x6EvHfQ1QwR2+1ktqosAlBLJv//GkLOF3re8RRUMn3EGleEEj
	 /p4ohogMZS2W6VXquw6f8sFVU921KRh3mOjirklZ6uliHStYAdFlrnCtSwO/0+h6KoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
	b=rcdLyvgi/kEcfGvTcr/rB+gdI0g1axE4oiv3XEe3FsdhyF0DyP73RqdBrSnlImU+R+g9
	 dovSVwxRzdCDprvl1k6GHAo/Q+x9gn/OJt93wRT6dEWkcuvXJlwJ2lGWjEVallOsO1AQH
	 lSxhridbVwP2Lw+zG3wmBZ0TphjJgSnt/x31YDjGhRrDFGr96mNRgtwJS746F96GOTYY0
	 m3mtUsKzcycFXija2JwhGjAUjSGp+SD3uOCFYbxGk5+vzCRz6MyNj8olM34PCanqU5/mL
	 qxAxLYCg4nhABWgoBUc6zJIJcT7GeFcjzT8xU2eEVJaQLi8V90IswNW9oEjZM9sQRFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiIYrwvC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17844606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 07:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17844606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiIYrwvC
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso2153743eec.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676619; cv=none;
        d=google.com; s=arc-20260327;
        b=QOk8UDgsEbk9Rwu9Re8sz2aiVgNMeEbEfYpV+aQJKp2i6KKCENr9L0EMAPMa+WYsPf
         500cL3vMpGSfTNXHpezo4oiSQ8yssQvikjyVAqNv5Wev+LwOMaYqOzF3ZaNTsMDt3raX
         xlsA1DIfn56LQtPYKD12S/FmGAeev+iNhO4SG7iyzG2HdoHwrXVDbDL25RIU262/q2bS
         7BP6KyIVpYLD6T1JMEgcLYSR6/H192LxjrDhM8elMH6EJlnMpF2JHDqGx+o0bcGcEzae
         YC80Iw1/eKJYXg1vz94XEcdSjvhMN1pjwGqmzg5nvUBV5h5vcZ3o+Zqx2BFNjhWOkdOL
         Hesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        fh=V+EJTkf3bjqbMk1GHlgbSulLrgKv/kJo3cJMZqHPKjo=;
        b=Nt76wPNcJRObRSBi5LzOqJRa0/0Lak/7ee+3ZmY1GhafOwgacwbLS2pMIL+1zIwj6m
         BLQnc0iBMUBq779qdo7MeS4B2iUf+6LOJQPnPgKGeA/d7SNNev5MjHJQuhFZm2baRldg
         XHQFh8MJDStbfH8MDytRKWZKAY22tSIBtKYA/sZdUStER2ZY99zB6xIvSM6YfHShovIW
         NihEiIxN/f8/Ohq/+cDsa8jf2yAMjNok5m6+QB/n7kaaJ62V7D9OViAY75vVomq4uZYQ
         0DCL77uvkGhC3XYP/7TTnJYbphCYrde4AGqNVK4z/LEfvptefIUNaPjYClAL+RrCiGvs
         4Ofg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676619; x=1796281419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        b=fiIYrwvCBeZKrYtTaJqUYvru4zXLx56SFmsyIIeLyqI6bBd/eZuJrjH/8vUJlyqSeH
         2WvxKxC5xA3jcMB05Fq8ZbZwTwuY9JFfsRVIOx/0yHz5FzGfM8zSQ64YLA6GTbnTk0Bp
         PFHUDxyf5ZbUULgQAEXyD8tTOhGellvjT1GGiCW1McfPoDs4j9cEmzISdp+/VAuqwfH9
         O5VmU0TYYlgOtHRNVRmgCjHv/pgXICsHD3vvctkRl4C+1Dii84GI+1jouEhNTcjAjwQI
         JuVIrMMFTpNAFAY433XxzAzcCH9fXRY6JFdWyixnHVBQGpZoyEWR6reYIqlVYmx2uOTa
         PjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676619; x=1796281419;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        b=ApgG9c/wTkydCRFERBJDiaOYWWjqtjICsUe0GLnykSyfuhMGZmcq9+hb/pargJv2By
         FftFFXxWCuK4IRTJqU5BE50wGn40kdlaALzYgB1Wgi5bvMI7aNBhqE+QMXJV+h3UMI7s
         06XqbkE1q5Cc40JRfoUNB6dXVVsV/19FQiXkUR2as6FZTZJJOhSX3TtN71TUad7l4pRl
         ZpWZbUn8Epm+rM2izXcRlrHwcMEzieskkJBzrc12IMakGa+/Oz/ZPG4yGLzspszzVy+2
         rTQMDLXjsr2nsBDFfE50b6PWk7Yq/kwLztmRaiGFeA/zUeNuEZS4hDxMHsPXQtJmzPG+
         Nvnw==
X-Forwarded-Encrypted: i=1; AL+hErFCoWJp9VjaXR/OkROZswUaIJkhkTNi8xwBwC/qCadCxpo0NGln5nQfnFp8eldf2ycRbnrB7YR04PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gvFElW11u4YxiStCrK74myYIn+9/utYlSO+EV8lccDEcu+dHj
	g6dMAMFFA5FWsGX87Mm+fUqqmmvYF27RmOVxOk81EIZmyfPDSx/IqduH4kztWuBed+OuiqQvFJp
	xG7envCk02j/PU7W3VFwr6QX21ZBXRA==
X-Gm-Gg: AZFdTZddcI4wAtKscEGrgaJvALsF4OMvzvKLk/d0HEmVg0FSQmi5UHX7LhrV32/0aF5
	f+J9Z06CPVL6j4aMN5ALiZcwTX4+4oc+oq+FcRav1sKYEhumdedjpc4o30pXuwOxMgTBCPOG+mO
	AfPwV3ag5TNLGmtZTi4zoHMKgo+I+FU9gNMMYQBVEfA/gp8YjqWkPmg+tpQkJb4hStizsulugYw
	GRxIcXBe2Si1GkSw0Zja+mb+OpSo+XH7OibooeOv0REpWQBbJynmqGR9vVmDYH9ASGGxshTcYXG
	Oi8j5mUTnoQ2BHkISXoGvcCebbs5rv1p+7OJhF7urudwnZdaozzvFldbZEDG0PwCFK1DfABk8yU
	KopuJW89jjXfvKKQUo9DVM5ywNOIALwdSXCAk
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id
 a92af1059eb24-1b55688dd29mr28250607c88.19.1795676619107; Wed, 25 Nov 2026
 23:03:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALa+Y14BNfdWH3yBY+ky1+Sb0YvRzW=gRcKKyGWWaBQkysPUkA@mail.gmail.com>
 <20261126020416.87656-1-sj@kernel.org>
In-Reply-To: <20261126020416.87656-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Nov 2026 23:03:27 -0800
X-Gm-Features: Aa3M54pr7zZt1s4Atym5UQrDZXCPmYeOf41IBUKmR70FxfH89wL-58DBqEGqTME
Message-ID: <CALa+Y15wc4bgERo_FEwxL4m-NUjx=_o0yPipUN+ymv7HTSUL0g@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] mm/damon: let users report their data attribute findings
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

On Wed, 25 Nov 2026 18:04:15 -0800 SJ Park <sj@kernel.org> wrote:

[...]
> This is the expected result.  The implementation is more strict for type
> matching.  If it is unclear, it says the type is not matched.
>
> For example, if filter type is PGIDLE_SET and we cannot confirm it, it is
> treated as not PGIDLE_SET.  For example, DAMON could fail at confirming that if
> it was unable to get the folio for the probing memory due to some races.

That makes sense, thank you for explaining.

[...]
> In my humble opinion, , the user could work around this issue by not submitting
> the report too frequently.
>
> But the more important question is, if the user really need to do this kind of
> frequent report submissions.  I have no clue at the moment.  If it turns out
> so, we could improve kernel side.

Agreed, user reports through sysfs are unlikely to be submitted this
often.  The main reason I tested at high submit rates was future
hardware samplers, which would produce reports much faster than a
user would.  I was checking how the queue holds up under that kind of
load.  I am happy to discuss this further once this series is in and
you share more on the next milestones.

[...]
> I agree this could be confusing.  In a sense, that said, those are working as
> documented.  There is no documentation saying addr_start should be less than
> addr_end.  DAMOS filter design documentation mentions "support of the filter
> types depends on the DAMON operations set".  And the probe filter design
> documentation says "The filters work the same as DAMOS filters".

Agreed.

[...]
> Good finding, thank you.  Maybe we could ask Andrew to fix this up, but this
> might be too minor thing that readers could easily find out themselves...?

Agreed, it is a minor nit; can be ignored.

Thanks,
Ravi
