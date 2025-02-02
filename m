Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CF1D6DC4
	for <linux-doc@vger.kernel.org>; Sun,  2 Feb 2025 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738495649; cv=none; b=qSaO7cj/7uflAKqM8g6HwXBYRvdwqIN9ADXwu0xnQa9yyq1zNxyn/hQywzp2p4L1rSh6njB8tEOpGwOkR2tsRgfqAsHuQwm5YO4ytcGxYHGiuhm5dlALpyjy1s0h5IsZtZVZPF7YEw6U2j7RrIDz9CuprH+wMeZMFA/fOK5UWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738495649; c=relaxed/simple;
	bh=A0N7dfr6K1fzZhhK8rvWhxEmoBuPJgHdR/qSyW51yWA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XKMxp4K+cJu7dl14vCLLOFe0+3DyafVXiDzPXRxRKptVJ878vRtGzLF4eElhV3OttTC60hFmhavqMnvKifEkMIQBnlg4tZ0hqUb9b5FG/hs14dEdxiZ3hyZTg9PTZpu/cPNoaoD+q/xKLBexqwAIZTyuNd1sGJIIsHzrjyRYcfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huhk0uRR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huhk0uRR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee74291415so4415208a91.3
        for <linux-doc@vger.kernel.org>; Sun, 02 Feb 2025 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738495647; x=1739100447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pOjAXcf70SxX67HFJBZtoZhOIvH8sDwDlkrX18fTTSE=;
        b=huhk0uRRFqIvQcaksnOHCGDAA6WSFqPg9z3Lhya2UuPgjzEMD6vAJQZKVj7eEgiHSP
         iCzo4F1494cPRw6ZfKE3sIgpmz+cqkI1OsdJ64oRYISpDOeRm/7ljJThi8kIB6RohONj
         CKwnkiHpNO0Gj5fJ0SkhaTb4EjWBwPIAEsBpPAJrWlWkmAVxf+pcRAmEcbaIAOf8868n
         xH7pdPu95bNkVPRvinDOoLtQsofQFlbN4gB2nojXmErBoLzKSKc45JrL6UMuFJmhKz/5
         jjhp+F/ru5Pb6HA3VFJpB6lzyyEpEpH38PvOLb+FKq244pjKWnhsrY38PjyLmFmWItY5
         zEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738495647; x=1739100447;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOjAXcf70SxX67HFJBZtoZhOIvH8sDwDlkrX18fTTSE=;
        b=OAKzoqoT2J9QHiLtfm9+URRAEvCoPS9+cS+Wn1VgHDkzpnaFbnhUR4E5BUrczlDpxW
         l9FgBdMjYlMbQ0lMTHL4hgATGbSM1zCQ/eS4yLdhKj7YbPiD8nQnQtNHc9i/TGbKuWT5
         NQC7RFVUeoLZLQdmjMHpVNdCYzSbdv//Or1v7TeFaNiUU7pxppsbzaBTUCVUK9013YHH
         KKhPUuz8m/Gc6mV5LwUHtb+87Wwqaixf6CUcVkjadEM2bZ7Pm9Mf+Xqw6UsGYSO7XJXw
         OG4psNbeSSVmKGSG2JOEmhM8SuyyFZ9kKlv/5i6WH8kIak1WRCpINoOhCZ42xfHF6NPR
         qsPw==
X-Forwarded-Encrypted: i=1; AJvYcCUGTXmBD6WBqKUsMXIZ4xYjW4AFwyxjKm5j8XzSAdSFqUzhvqzqt19w03Py2Ut+xTaYHhu6maXPil4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSWyi2y8znZMkMBVoG7jH9Rv6juOPS6o7tBBQto37S7P402Xs2
	8kNPKAyBeRgSzSvSf9gDJ2O3KE5EPEXAIrGufZiyulHbjO2gfeyd
X-Gm-Gg: ASbGncsa+mGXzfjifnDGqJCW9+9CdIdvXoHMmNnfvYCkHGDDeS4wiyFARh8dhm/q4DP
	y2Sbzm6HQNbQSN3f+HSEJwe+GvCfaSgRdxIYajVvN6s6ITy6ifKPbCUBGvEnEyvMyWQV2Gw8WrX
	rlqIm3Zxxbsn9rMFiJlWG2F/+hMnUYWGgLlm2XnAaHd+BEjkhZPgezsgkkyv5wOTHeV0UP4SJnY
	/Rv6Egd4He/aXPozYHzWF8O46gYj0phJypzxX3PRCTygEacsCEX55oLWNfdOFhNm87HP3/Zelpx
	i0MbL872qs1GkrDC1PnbTGeoUQlNjDCWxLU4Vh20RFzjPliMaogjo58FVbFIYg==
X-Google-Smtp-Source: AGHT+IGoXGcZK4VIYunCL0tN5iu/S36sTr04pGI1+DxPGczcYVSGXNwckktXsW5zbyHy+Kd9+QMOCQ==
X-Received: by 2002:a17:90b:280c:b0:2ee:7538:be70 with SMTP id 98e67ed59e1d1-2f83ababbadmr24604675a91.5.1738495646817;
        Sun, 02 Feb 2025 03:27:26 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f6f4bsm56972945ad.73.2025.02.02.03.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 03:27:26 -0800 (PST)
Message-ID: <b07a56c1-8b4a-4f35-b94b-095305c1f458@gmail.com>
Date: Sun, 2 Feb 2025 20:27:23 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
To: Tsugikazu Shibata <shibata@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org
References: <20250128102805.112691-1-akiyks@gmail.com>
 <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
 <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com>
 <CAO+cJp1+ZtQgy4JoV4jvyPBf8HDUPtnHE6OGkS0Wc7j=rV4smg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAO+cJp1+ZtQgy4JoV4jvyPBf8HDUPtnHE6OGkS0Wc7j=rV4smg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tsugikazu Shibata wrote:
>> Do you read the list that way?
>>
>> I don't think so.  It's a mixture of suggestions made in various grammatical
>> structures.
>>
>> For example, here is an item in original submit-checklist.rst:
>>
>>   3) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
>>      comment in the source code that explains the logic of what they are doing
>>      and why.
>>
>> I don't think this is in the form of TODO.  Rather, it implies what you
>> should do, in a sentence whose subject is "All memory barriers".
>> So I don't think it is worth preserving wording in the original.
>> List of "What you are supposed to have done before submission"
>> is much straight forward, isn't it?
> 
> In your translation, most of the sentence is saying "whether you have done"
> or  "Have you done something" in Japanese. Those are asking each item
> to the readers as a result.
> However, the original text is not asking the readers. That is what I
> pointed out.
> I feel we, open source developers, are historically working for their
> own motivations.
> So, this checklist would be written for the developers for their self
> checking purpose.
> That is the reason, the list is just saying "Do something" and it
> became the TODO list..
> It is not "Have you done something" because that sounds like "Another
> person is asking you"
> and that's not preferable for the developers in my opinion.
> I really hope that kind of non-written understanding would be included
> even in translated documents.

Thank you for elaborating.

So, you read authoritative tone/nuance in my translation.

Let me see ...

You suggested a change from:

+1) 利用している機能について、その機能が定義・宣言されているファイルを
+   ``#include`` したか。
 
to

+1) 利用している機能について、その機能が定義・宣言されているファイルを
+   ``#include`` すること。 

Actually, I don't see much difference in the nuance/tone between them.

「〜すること」 is sometimes used to indicate authoritative ordering.

For example, "You should test both of cases A and B." can be translated into

    A と B の両方をテストすること。

, and this can be translated back into:

    I ask you to test both of cases A and B.

, depending on contexts.

Instead, if you just say without 「こと」:

    A と B の両方をテストする。
    
in a list of what to do, chances of such an interpretation can be
reduced.

Do you prefer this approach?

Following diff (on top of patch 1/2) is my attempt to address your
concern for the first three items in the checklist:

Here, I changed each sentence to have "patch or change in the patch" as
its implicit subject or "主語", and describe its preferred state.

 コードのレビュー
 ================
 
-1) 利用している機能について、その機能が定義・宣言されているファイルを
-   ``#include`` したか。
-   他のヘッダーファイル経由での取り込みに依存しないこと。
+1) 利用する機能について、その機能を定義・宣言しているファイルを
+   ``#include`` している。
+   他のヘッダーファイル経由での取り込みに依存しない。
 
 2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
-   についてチェックしたか。
+   についてチェック済み。
 
-3) すべてのメモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) に、
-   その作用と目的、及び必要理由についてソースコード内にコメントしたか。
+3) メモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) について、
+   その作用と目的、及び必要理由について説明するコメントが、ソースコード内
+   にすべて付いている。

Do they sound better/acceptable to you?


[...]
> Fault injection on Linux was developed and contributed by Akinobu
> Mita, a Japanese guy.
> He spoke about it at the Japan Linux Symposium in 2007.
> In that time, we have discussed how "fault injection" can be
> called/translated into Japanese language.
> As a result, he chose just "Fault Injection" in English, not using
> Japanese Kanji or Katakana.
> You can see his presentation at
> https://www.static.linuxfound.org/jp_uploads/seminar20070710/LinuxFaultInjection-2.pdf

Good to know I'm not alone in disliking transliteration of the term!

> With respect to him, I would recommend using English "Fault Injection"
> instead of Japanese words. I hope this may be a good solution.
> (I found the name of Jonathan Corbet at the symposium and saw Randy at
> the previous event :-)
> 

So how about the following?

  4) 最低限、slab と ページ・アロケーションの失敗に関する誤り注入
     (訳註: fault injection) によるチェック済み。

This still diverges slightly from its English counterpart of:

  4) Has been checked with injection of at least slab and page-allocation
     failures.

, though ...

Translation is hard!!

Thanks, Akira
