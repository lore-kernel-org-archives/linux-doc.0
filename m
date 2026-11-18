Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795018202;
	b=3F03qbhx5K0UV1xZ5zlwkE5zyeVnMD/yV7unorkRpvCpoBrMoanFbV055lGg63Ki3sLP
	 se/QAQFB0zodgV/wmFSfB/60JYBpTVpE910Txxu11WEzV6AnhpJkJoC9kkyw1VPJJZfaw
	 8Tz8sjM2uYJEwSwNocTdGwTbKoQP1sW5BfwRd3rjln7nBnMe8c1ZXCRPWOYjjgQsCW0IV
	 t6xOsiGt2OmZCPh7Or20CAR+0IP+1NFtLX9RCp9Oe4ZljprtNaqn3UKh1gTc4UqgmZ67E
	 GgYNQEsvzAmMkDkarVUmjugm7RYa/0fOOPODEvr+kaOSkvQ92HNsVYC5qox3GD26Vkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
	b=VSvB0Ht0Zgrr0YI118eUuhTK2ipYRxofN0UwKQlQWHQ2q9f7chE18F9kXeER+BSMTTX8
	 wNU3km8xmx9RAPhaxcoPBKafIXxCqrq5HKkkrlxO/P/HphYbjTCeeaNhPwew9qfUB3+d0
	 PzHVHUlRvMpDJAWzC72SKzK+o4Dg508WwNFGP4bXEd6fMPW/3lsShZxSxd3/pjOALj7g1
	 wRnjXbsjild/q+0OXUxn6yXyuHXUve34uK11AW847rgh1ULqfH2COMvTr20DF7dOhrqrR
	 5IoKDTIunHHmR1BmGqpxwkTrM6pFNtOO4pbLmcqJB5EsqeZWEKnDqiWK9jEdildsWqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKpVVSBx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85D606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E85D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKpVVSBx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12323195e9.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795018200; cv=none;
        d=google.com; s=arc-20260327;
        b=H+DtfmzLlVPO+808STTVBfBZbSPMMVIwi+1jvkGctBNSuyt8ifyBxl/aQBtzTkDkBX
         5VaheEspHf9gSGTx1c8lv5RhxMnLYOzMiKvVOnc5WXTwIUgFrTDaQ9ZxVZb4kwVSMF+7
         yy0OCTcCMQxGFqhPe9Qz9fzKamYbYpP0hQmh70HypeksvPIfJ931DfQwKZn1fU69JMyC
         ekvn5zeT8VRRSAe2moHr5LtBYolu9Rlsh7z0cRcREpflp0m5ANY9LLBfdWP1pkQpByfa
         ccxjSpvZEQvzwUeh9tQA9aIDU6lmOh8Fnt3pLOdFQe//qtBZkQEVdC5G4lzJE7aE4iDa
         ZsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        fh=Qd28eXYq4GLwzBcCrhTrXBmKhnVHqbrUf97/g0srxnA=;
        b=g6ci8/z4nAQyh4H/zMkU7cqeuO9xxz2/kdeuShN6/+0NZf2i9XKm+y7N1GHry331nd
         0IRD8k26ktrhdffcjLgvnc+cFWbpfiE7b0WSras6RTmqoJI5asW1oABU8LvJ8v3YnFyT
         Zmcd5I1737KjbC7rgyXc1W5KwdEBiylolPMpHTR2E+xxdpPDlFasxxxwQmhC77dbZYgZ
         N0EOULdjLwXE8WixR2Tqhsikkx5tBkC0jnxCasEZyGLK/ZO45ZAlPoP4MY287MQmJ/UZ
         hhsNuK787o+3lRlIHlrjaMUFYAEwbJaPFIdb30vrRjgEIQRnfj4YTFAS0s7Qh0Pd8Log
         Nkgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018200; x=1795623000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        b=pKpVVSBxsv0XSkTMIy8QhpV8iYfpJgFtuIOOMraAqkh6IoY/LmnCeoFY2+atEoT7Mm
         51yqYjvClrxz7PJEnwcKX+ag5vvKZvXQsxOzLhCYh4JsRBfQzN29l0NprtTdgWvsd6ix
         AH0QnRKu1GLZ31o6b5lUrcbRaETqVFDnyZJS7t3cmGzJhOaIhFJp2bMr5emwdD29hhJc
         RTs7I+nGHlyycNopVtnLI4PuG1cfcui/Xum192WTkqg+lt112F9t0Y4AcEwSdQ+g6qnJ
         fEyxFj0SlLXR+vzEfwDVpIGqxFUfo5VZRX4qXbDxIZEzPRytaBJz01a74eiTXZMyIuVA
         jVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018200; x=1795623000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        b=JNl2BGka1RAnOphu+OtT1ANg+svFgI+APc1bVvHSAYgNcFLw91lqPrRQIXAuftZ6bt
         TvqWhkDpazwxecB/mCfTIX3lZmwyf1tAqqwdeQMnTialrhEci8nT1GwovWds1d7gUObO
         DHE9JS7XAiTl3BQ8S6R+t7sWgUPcLGy9COGw36LWmsmgLGUP2dfnaAMiXuXNB+5UBRPc
         8/XELPPoFXV3kvMOYONuI3HLSbl/mwT29Scu7y9krFqDbK8ySQ7FCFaT2Uw/27keHQmL
         FiycKs3msUjM0ja8Ci7JH0nnPdTsq9aebblNn0IWdhjTldKgMbG8hPYYvjH2Se2ixKnD
         Rz8A==
X-Forwarded-Encrypted: i=1; AL+hErHtWFm3Vv+y8p1k21Nf8KDk3hQIRliA3ih6xBDXg+AQxTh8IJhpPJoNhTVVP6etxMngMQgg+ncxKdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XsreylcNuinYGkcVnXfr8vHqQ0C3sKud0R6PxGVMJAo9aA2bH
	EzyHEwFuMBFoAHEzSrp1CK4bXQCs7rBBgwNTl5uPRuttWv0KLUCg6Y7dFt98s3NnHfcba9p+Bn1
	O8YTi18Y7IE38oC2RY7ExBtmh6VHukCI=
X-Gm-Gg: AYBFou2j9exykU7qVVR3KV0v6pafO5YbXLN85ra5dK0RpX687xYidDJpMVtglbp9r/Z
	huCL5cOYm+gxpPDGGFvqXscbDRv39Py6CgYtFN4aAYKnVg0zRhxNqth4F8dLjvCyPcUO/eeXytx
	fiS5lRTMPGReBEgpHM6cIa1CjRIIg9Ccm6Cv5LCdhKKYWA3zRek9zZxIB/GT6qzY1Y1+pAfMomX
	/thnuc6AAT5MrRY2k2w1ZJZK7k4069d2+kMyAyiw0RavsG/o6IgasINrC75tR5ACvcb4oGtAIiz
	39Q27/PDN0IAzl4gh0gkpA0knru7yKBc1ThRKo+TTYbsRobBfiPZUjPMQQ0++z92nq3OaqwYW6F
	PFUYV0PU70Aye0mtzC5p4jAibvVA3qsgHrDP7oi45xAMzbC9eQgPY471qF/JOZkG1ftPsqXK5Uk
	FqlUzr0brbjH+pHM4A0ZLRjWP3Qt1YKZBBdYtTWNrhXZ5YE5nGoJDizg0K34wVNXNYx/1g9Jl2v
	RJ0
X-Received: by 2002:a05:600c:3b1c:b0:4bb:5d38:259f with SMTP id
 5b1f17b1804b1-4bb7da24a26mr60211045e9.12.1795018199716; Wed, 18 Nov 2026
 08:09:59 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117062620.346767-1-yumiao@kylinos.cn> <20261118130537.750211-1-yumiao@kylinos.cn>
In-Reply-To: <20261118130537.750211-1-yumiao@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Nov 2026 08:09:47 -0800
X-Gm-Features: Aa3M54qRdo3OaZ77M4orB5mZ70nSvNFV6Jxp2gOAsd1jbRDwyTe3QzmeCNTj854
Message-ID: <CAKEwX=MssYOr0J7tk54qUF7DbNb550KZrFmwnBD40L+tWde+5A@mail.gmail.com>
Subject: Re: [PATCH v2] Docs/admin-guide/cgroup-v2: fix npn tags in memory.stat
To: Yu Miao <yumiao@kylinos.cn>
Cc: cgroups@vger.kernel.org, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	jiayuan.chen@shopee.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:06=E2=80=AFAM Yu Miao <yumiao@kylinos.cn> wrote:
>
> The zswap, zswapped, zswap_incomp, swpin_zero, swpout_zero, zswpin,
> zswpout and zswpwb entries never show up in memory.numa_stat, so add

For the (z)swap one:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

(but the rest LGTM too FWIW).
