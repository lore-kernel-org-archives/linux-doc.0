Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46431CA78
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678932; cv=none; b=LGG9GaAL8KZ7KwN3lTtkyMEcp5RpOab2uXVX7ug0W77f3ZcTQ/ulZyT2UnbK4fbjI64qAfXJvKf/ftgqd+S6DqccaLdik1RnjS6BwBTRX9hQm50LxoBhwnBCp2xJZ9yA2ijfLHL4N6p61grVQZc4+MGW2yW5NTJnaxznzWJcyzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678932; c=relaxed/simple;
	bh=pg2OzxfdDmvV4PZ3/yrEF/ttLXM7KmEXR3GgYwf88oM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=MVXz2f5PK4/0woB9p6PuI1qptsVDbDKRH2OBuiJ4mxrDmnNFYogj2al2c9SNR9HH8OJHRbCt1oVvqvKSI4Ot3e/D9gYCqtc+oWfvfurXJDkCFpWOj8oD0awwfP7wTxHUcV4bA9lchoJy60eLKfxoLLZnDVJ51fvMhTxD9nFh++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/oSd1W4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/oSd1W4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so16374805e9.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757678928; x=1758283728; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3mBB6R4Rvgptsn0OxjqAYg70NanrEyHXxP0kqh9yyw=;
        b=j/oSd1W49q5GqUpc4lcLYvy2FpJ6r6ZYirBlz6SCqXtj+q1E4NhrYMAZRt2jCALf3Z
         aYdOqFTvZZ7W3ga1P0A4UJ4iPdackJG2xm3HJTeoqJnVJ3+xXSFFYLDYJ6rBlWxTyIvS
         u8CIOf11nkX+DDYBU9a4/FJ7TDYPDJTJ3d5Pjn4MOJcDzWSBjvjp/59HyOerZOkzWRrz
         P3Yl115aDgI4ZVtknoMN6rAtqJ9Uh9w+3qjzQK3X0WdDAvFPmDmhCLcS/QoXXqXtzi5q
         EgzhFN7HpA1/iV+GgMS10JQNKzIiXB64Iukc582CTVveKrg/kBbBhvImGFf9zN8MN/JP
         z0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678928; x=1758283728;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3mBB6R4Rvgptsn0OxjqAYg70NanrEyHXxP0kqh9yyw=;
        b=uVCSZftLk9bvVuYstDtSSQx/o/gKmuAs9hoE2+iHljlk4MR/otEYQEb7xu0Tw5ERYf
         vbapz8L8X+ghj19GNPEFU56IF3vxZjhEFxObZDozMO9oJKq275YRXhVpoch4pHMrDjln
         eFKfrASu4ZM1VhzIEBGvdKJ9ZWO/v9V7I97DXcuUAIJSzNPfZ5sXosNojsaMZsGnDqGc
         Nvg3Ga7egwvoNYVrVCKQk3y7Ae/d1Z5Yko7ky0AB8pH5m3hgxfdAKT33BwjeyRU/yTwW
         hKRwsaqkeKFhEbWazkv0/F0ctq7cFjGesmeju/imD3WGokY+5F9t1TFwAXP/p4/25IuC
         7wKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf4/1CYNU777mIwuYM7y0Tlaa086vpDdmfgYa6+EyWh18Lgd45XwDQ7/PATcqJU1ZTfGRCN2QD0j0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3gXrL/5zPuDAEy5loeQjhjytIV14SwLCPji03RhWsYcx7T6k
	knqgRWtQwhBmWDfsRd4mot+pCom79inEHHBPjhmWYnrPAhV3LsHummrX
X-Gm-Gg: ASbGncteN66F5jw+oTKKDucL+nW/ugz5HbofNusHKcPtQsWb9HuV/BMWtbwU+ZXS24j
	18iP0hsSLpvJD4KHOTUBdQZLLqMrFbP8cT3uEsKXwj+2rLkeldWJZTKeH5cgCZ44zuLGjUPgqoQ
	zGEsZICcsf4Hr2xlyvzpRkm+09GUeF4i+GWRsnGJPHjw+FPv1+RnQVyhYbXz/Bwc0xSjehm9qER
	d4guUcxrCb+bY1Cmq6mYpfMooKqOGUzk9HFQeDWG8DwTf4GJ3RJawnjODSVos/C4xUXZoIaAGHE
	eFS5WCXAWF/Zr2y5FL8OZYfMGCh6I3fgd8FzqUvNUpGvdIX91x/pPU2ndDgBgQLfOJRfkiSXVYu
	ejH4f7WkqJNqO1/pd/HuzV+f6Z9U66BvEdg==
X-Google-Smtp-Source: AGHT+IGv/35p/W7r3GHx5SA997jhumk8Hh17nHWyXFsjPVhFKF0I3tiZFXsC/nBQd4qsEp3pwnV0nA==
X-Received: by 2002:a05:600c:548f:b0:45b:8ad2:76c8 with SMTP id 5b1f17b1804b1-45f2125d5cdmr28593575e9.2.1757678927561;
        Fri, 12 Sep 2025 05:08:47 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037186e5sm60557925e9.5.2025.09.12.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:08:47 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,  Jakub Kicinski <kuba@kernel.org>,
  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Simon Horman
 <horms@kernel.org>,  linux-doc@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: rst: display attribute-set doc
In-Reply-To: <a1f55940-7115-4650-835c-2f1138c5eaa4@kernel.org>
Date: Fri, 12 Sep 2025 12:07:04 +0100
Message-ID: <m2ecscudyf.fsf@gmail.com>
References: <20250910-net-next-ynl-attr-doc-rst-v1-1-0bbc77816174@kernel.org>
	<m2v7lpuv2w.fsf@gmail.com>
	<a1f55940-7115-4650-835c-2f1138c5eaa4@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthieu Baerts <matttbe@kernel.org> writes:

> Hi Donald,
>
> On 11/09/2025 12:44, Donald Hunter wrote:
>> "Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:
>> 
>>> Some attribute-set have a documentation (doc:), but it was not displayed
>>> in the RST / HTML version. Such field can be found in ethtool, netdev,
>>> tcp_metrics and team YAML files.
>>>
>>> Only the 'name' and 'attributes' fields from an 'attribute-set' section
>>> were parsed. Now the content of the 'doc' field, if available, is added
>>> as a new paragraph before listing each attribute. This is similar to
>>> what is done when parsing the 'operations'.
>> 
>> This fix looks good, but exposes the same issue with the team
>> attribute-set in team.yaml.
>
> Good catch! I forgot to check why the output was like that before
> sending this patch.
>
>> The following patch is sufficient to generate output that sphinx doesn't
>> mangle:
>> 
>> diff --git a/Documentation/netlink/specs/team.yaml b/Documentation/netlink/specs/team.yaml
>> index cf02d47d12a4..fae40835386c 100644
>> --- a/Documentation/netlink/specs/team.yaml
>> +++ b/Documentation/netlink/specs/team.yaml
>> @@ -25,7 +25,7 @@ definitions:
>>  attribute-sets:
>>    -
>>      name: team
>> -    doc:
>> +    doc: |
>>        The team nested layout of get/set msg looks like
>>            [TEAM_ATTR_LIST_OPTION]
>>                [TEAM_ATTR_ITEM_OPTION]
> Yes, that's enough to avoid the mangled output in .rst and .html files.
>
> Do you plan to send this patch, or do you prefer if I send it? As part
> of another series or do you prefer a v2?

Could you add it to a v2 please.

> Note that a few .yaml files have the doc definition starting at the next
> line, but without this '|' at the end. It looks strange to me to have
> the string defined at the next line like that. I was thinking about
> sending patches containing modifications created by the following
> command, but I see that this way of writing the string value is valid in
> YAML.
>
>   $ git grep -l "doc:$" -- Documentation/netlink/specs | \
>         xargs sed -i 's/doc:$/doc: |/g'
>
> Except the one with "team", the other ones don't have their output
> mangled. So such modifications are probably not needed for the other ones.

Yeah, those doc: entries look weird to me too. Not sure it's worth
fixing them up, given that they are valid. Also worth noting that the
two formats that we should encourage are

  doc: >-
    Multi line text that will get folded and
    stripped, i.e. internal newlines and trailing
    newlines will be removed.

  doc: |
    Multi line text that will be handled literally
    and clipped, i.e. internal newlines and trailing
    newline are preserved but additional trailing
    newlines get removed.

So if we were to fix up the doc:$ occurrences, then I'd suggest using
doc: >-

Cheers,
Donald
