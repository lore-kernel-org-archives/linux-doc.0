Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089071;
	b=wBu3CCjCYu9ZCzbNWzbBZmssq5Gf/4r/fX7ScgGcolCSUmN8FYmuvWl7MIGWZu3XTR6O
	 mEtP4izwwdYDRBmR/L+Ld8l1W0fyLDdgdl/7bRpmC3GJle9dU6HfgHSGRFyiZX9/Ygf15
	 +f8Dv3dMsq/TkWP4mQa/CRTo6Nkpkmxd07kdvpEVQVwQH07G6bkOo/F2OKI3lmX8QG5P8
	 GGJzOgkYkEoZ+QxZEhlQNdGW9smwsh22yV+W/ZcaJrrjNob6nQnfHnjrJ5NZ3JDA+5J56
	 Bu+Vq+CIoruRTGhiAhomsGvzIQDYAbDqCzzSaR+tZmd6AZDnt2DGxmd6LJ93lCsrMHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
	b=WqvWSzHjMUEPrZaeo0XvktSjI7ULs1Xn4nuQgTqAEnj6F8Z1jXHv+rv7U0JQRSxnpWyv
	 LXJhN6fmqD1TnfJdxfFqrjxRhIWxpQJTAx12O2kV7nxKjCpn/iN9hXk3Tk/w6AISa5nup
	 zill0MQ9AfLAQn8FpegG6VFyHLOuk7Cd0Nn+8dYBHEDt1eXhOlQi37jdDZmmKRap8GTDQ
	 CSUnTUdd/p6FxcdbKmYLyLz8ydf7qnfqT9zBeo+FjcVQrWZX4zJpyOcN+v3F9ksSJ9F7N
	 lUQSQiJ9VqCmSom+QJBxtwAnVqMHU86onTQJJ5pRdqH6ADlae3CyLabZ5UM1d1dL9ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sckrKSYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C8606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sckrKSYv
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso135813e87.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 03:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089070; cv=none;
        d=google.com; s=arc-20260327;
        b=kweoEjvptILOerr9sw29tumkJrX9N90EHDG1HBPNVBM4tgUyusVKknpm6IpIYpZw4D
         cc4JnL6zwhZ9NROEkGj0fO+61wK6fAwTX26z3sltgso7vJxjp6Z7U8Xm9Uh6qpp1LHmc
         BaoGJVti3bbtmt4T/Icl+lSbChqmpFVEKJG6vn4rau3reT/P+EUN7IFUeUE3KoUtcu8n
         ckiUhAhxpgfOQlCym/oFLuwtBmRJ+IuB6n/jWG4Jg3sE6PD3+/EluCWbkzV24NF/29tD
         92C5Nytl4RictGWAn3bu/vIo2nMETBDrllPstQb+IU/xW9p/Fz4H3FZD804esOGXRVKu
         awSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        fh=2thN2R+UEoYWmOcTtQkvlJAZCfqiKsy73F+wfPP7Xwc=;
        b=Qjz3ygPMTr77kXAQCK4Q4biW/MHwu+Rc9kq1LC7cy/tlb/plZZnpgcipv1Wmha9r7A
         Gt7NFZJ0Mjv0IISVdg0+rI+6Js2ljulE08fVUSBNrH/SgpznFDs8CWYzPAHvFMVj2950
         bi8V1EPrUHhA3TsKZeRxuITRe6WNC6mQUVcUGJEsw5PMmyow6GW4jnJA1Ui+rkm2RMEh
         ta3Zij6YE/BAw3Qw9X6KV0kHTtOJabxiC5HkgRPsIAnycTH6N+3nea6gy7/d38q6Uydh
         q8UM7DLcRx3wPws4BGBOAkt4bzO6MlddYY76d0nBjU1xdQi4JQYFl6n1jmc5n7f0Rofm
         lyug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089070; x=1795693870; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        b=sckrKSYv/QGVKRRpts1oVCue0TiMwJJYFBB6ebLMxtns9MI6LhhawUDVlf0pfBQ41+
         X2T6N6UhOsXi98Xmoh7zdXbQcdJlbDaOPGxtKvDTBRRCtWBhdfDXyABQr7SHcgWcv2Wf
         3rM6TK+fJC5/vTeowL+P48i6wqQYZLKRH9/B02+ByBZtPT7hed97+JlUoF5XG9mgxg5a
         y8MQza0MEqJrzUEKkHGPGUjmW6EdXEdo8jvu6+QdcBiPPMPsgBNjX2UriSJ/C/yDU+vZ
         7lTlg9n1HgCGCKBGZa6Ck7WCf8sIS9uh8XwRR+Gm4SgnprxHhyIBd+xEq3jJV7fWBA4u
         /kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089070; x=1795693870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        b=CM5CD197V8NAJRUjeX7QA+hmAd4pZETvlq4F5Q2so/tw8ZIcVzBFKCX8yyMXNA3Jdb
         9Ujs32Hpsr7RIjAe6SbGq4G3DDwtY5EElu24C+Av90eGCzwKicTBV47UEXIlGEb1MkwQ
         eW//Dc1YmgstPxaHyz0wxqY/V/XCALQ1fHm9anJJEDr+4Qf34Z3RMgUX1dg6QdApKEvp
         jN1CFtPfHMl+Jk2kmcoTdzVhdii2A587DtAKs0TUsMWRiBB0fAQDWw6FwjrGBv6WPgxC
         kJymo+xxDQu1wmrqlsFzsA22dVxxNUWSeaF1toyTLgRolU2LmX7slJtMWWpvZyI/N5L4
         F+TA==
X-Forwarded-Encrypted: i=1; AL+hErH1Y2CPtXxYCii5XmMXjYbXo6lEj73KPfQu5S0WdSsKU3yhrll05ABd0DjElQHE6swTSayQreygBfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h4NM2xNBJr8aWi5SD0L/9tvRZgF3O7U44ELU+Y17/RZmsp8EC
	nWidum3D3TMZtV3ZecA8x5SbrESX+/RB4gIJToDhZisY6dCZCkAqKIaJqO7iMtkjq7UOj+yZZbi
	AFUXTLwkERFeRJYjaFjEH0MwLzgAcX7g=
X-Gm-Gg: AYBFou0v3koKmOVl1NOWLVpRHrMbmgT4XlMXd+/0JcYfOhREFvK1whneV9/+LVeO0L0
	RjxrFHZNbdKRmFRYYS6+BJ+sScD69qlBTr/ZBnZe+29X8CuauPAbiKzMmTmPWef9I3ayr/+5WIB
	qi8OJCI59U/X6cyonIYSjInE9PYTWKax8oc4A/hujwcydLpfwVXAatTHYeGjeL5asdP2MDSY7Yh
	sh4h1jRCDW8YD/TYUDhKFN7tpHFdi08VKAjTrljZQfFV7cxXjLv53hj+g66hqctAeCPlAfuFSoa
	w1sfUxOSFnoFt+XCV10eJk2TkKOFP5LA0XHqjYoRQlwdnEh2PTcXr2kj/k5460f93aR8W0QmJ0T
	kIv7WsTdBc6ljWT6Re3cTFR2mqoCkmvxOF5RnjYd2gvMyAtE3Odh3LibyQF8rnDLYFuz47lbqHu
	8giZczjuNlhPKBrE4inA==
X-Received: by 2002:a05:6512:228b:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1aa0397dcmr2129351e87.3.1795089069422; Thu, 19 Nov 2026
 03:51:09 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com> <avVQdrfqVqRfY5ex@wyuan.org>
In-Reply-To: <avVQdrfqVqRfY5ex@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:50:57 +0800
X-Gm-Features: AclHuK_Q8YqRxZ-ygE4RiYk1Kbl1desnGLkbZZB8OsP3kRuJBXbuWZE2W-HawRA
Message-ID: <CAKspUhLvHoWW9unBOFfFrykdxpBswBraaBJnbxpC9rg7yvTFUQ@mail.gmail.com>
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 01:36:54PM +0800, Weijie Yuan wrote:
> You used <tw_codingstyle> label here, but after rendering, the html
> output is still "Documentation/process/coding-style.rst", which is
> pointing to the zh-tw translation, not the original one. So it is
> inconsistent, right?

You're not misunderstanding, you're right. With :ref:`text <label>`, the
text is displayed as is and only the label decides where the link goes.
Since the label exists, Sphinx has nothing to warn about.

> I suggest that in this series, either use the full path to refer to a
> file directly, or stick to the discouraged writing style and wait until
> once these two series are completed, we can then carry out a thorough
> cleanup. What do you think?

I'll go with the second option for v2: keep the :ref:s and labels, but
display the zh_TW path, e.g.

  :ref:`Documentation/translations/zh_TW/process/coding-style.rst
<tw_codingstyle>`

so the text matches where the link goes. Turning them into plain paths
can then go into the cleanup together with the label work.

To make sure nothing is missed, I checked every :ref: in both series
with a script. Besides the ones displaying an English path, it found
one in embargoed-hardware-issues.rst copied from the English text as
"Documentation/admin-guide/ <securitybugs>", where both the text and the
target are English. The zh_TW security-bugs.rst has no label, so I'll
use its full path there instead.

> Regarding the "ref" of one specific section, I remember that it could be
> referred to using a relative path, and with a label?

A :ref: only takes a label, so a section needs one, like
<tw_interleaved_replies> in 2.Process.rst, which points at a section of
submitting-patches.rst. A relative path works with :doc:, but that
links a whole document, and for that a plain path is simpler since
automarkup turns it into a link.

I'll leave your Reviewed-by off this patch in v2.

Thanks for catching this!

Chen-Yu
