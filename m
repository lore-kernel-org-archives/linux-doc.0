Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5053D9D4
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080512; cv=pass; b=upylOGoquZzD6Xx0gPbz1rUe7827QNLn/E5sS2MIiRtcGf9cuneruQaFL0hOZvMPYp7PbaNjgAMSojIfNPrhTl5CkNsp8hlmLAp78adinfnYGtr+Wp2rQ8htdSZO2SpgalssR3FnblyndaZxPbO0y4rGzTtM0x7zPQCf/vFAYGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080512; c=relaxed/simple;
	bh=ALQACn46SAuo6ABqMmWIs/jscEBUUZDaANiX89ENIH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Tuvt+YlKNNvlacDj/VVjJIa/Gp3eQH5tS6ezvCj9ek6lnos2KTrYp0NXVhf+gUYQlCR+Bf4Z21610NbCj4JLul4knHT+CDd+lJyWDMqY9dGuorA9Nc+q6FtjI6XpgzjRxAv1MxeVWkqMsub3OSVi89ZtZrU899hx4O8fCkBV5uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4p3m//6; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4p3m//6"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67115162084so471396d50.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 05:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790080510; cv=none;
        d=google.com; s=arc-20260327;
        b=Zpy2PpSrf69LizrB1Z9gZgdc1lIQk98f3+GJII+1HJZE0y+F51Xv2fzFLgPVOzZv1i
         D3WNPU4zMYuIgxCHXAApW4B4QGARQPFKYp5JTrulj4HqZz6CsDmZvfYV9+myKf7waNao
         GcHaiWf7KW15rCjieDnm8aG8fjPzpiaeY1CmjMw5uBBCQgxkSCO1CZ4P23rjfxbZw9F2
         uoPXTox5A3m8f5u27V0yNvCafFOTsjq//x0IyqyCQ4nui7PMq70VQbXdWyI4A1hTvlZh
         L46/2HXFHbxNujn7s0lcyxt525eHW8rh4M7heY8Nhmr+BFVY00sO0XMkPfhOjl3DaGTB
         8nAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        fh=ZRwufeO/yZqXAsXoDvgg5XJ0eBwvAzuyziHZEdpJh+U=;
        b=DU76qrhl70Ih9TCiBJQ922nK84xlIQrMCoXwX15QyBdsxNPak0JlTrW0jg8z4Ulgvl
         TgrYEEhfhl0cgAqm8WxxYeAixMSWC79/oM87Ek/bbxDWwB4+6n0yhrIjXaCd/W3COmc1
         q+QaEvs33Z4efRuKZ3i6sqCz08CVkKQkD4e+Z+AvBsE2S+hFpdCF0DYC0ksdP8ouPE4x
         ihLRtgOj9E4YZkYthsV4jxQCzd0yUImx+Ih3h6w+1MiD3W9buab67NSiYAcyYaqGqyoo
         x2Cr/MsB0pi9UXWqW/2Vt8d8mzVU7XdGdtN0EOwrvjiztbzHKpFXTNSrOut+04u1pWhS
         xvlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080510; x=1790685310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        b=k4p3m//6V0+Rbj6cPKa/V6v4U8qO8VAJYWkYDYjmAii0iyYKVYDTCllEp5+reHYaF8
         oBtsGtuzBTkFROgMLRlYwqL37WEBuF8o6lXLe7pbR4IuQBB+VUKs0OuvA3/bkXeKQ4n3
         thKV7waI5tPr5VfwdunzX6pzvbcZiMd8Ken0pQ++bgrz3R0tnjmJjkI2USd0le/jB35k
         n2rBWtNm+Jv7N/kaeJRG+x0W2k4TklT7VBXgVK9zzm/PIEDPxxdnwoPxdY7Pqi0TdlCC
         0jv2KOjO/guGEYMu3wFaFYGVmJuKFcqgH1D/tloMDQU4UBdA2QEsGuoYXcy4IhfxEP1h
         5/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080510; x=1790685310;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        b=kgSwrxZVC0io4htVKbTB2tnYyVt+mJQM4xZ6ywLKCwLkdtTUpebaEfWFUx1jPwav2d
         DxUo5Huz8XEZ98VrRKiiPPic5k6TEQ/FF+dnDzyf7qoKVV2POduah/BpCrotkPPSYwHO
         QsJ6w24u9c9o/NKhUxth+WXjqzYTn0emfXUbDTmH7MFOO4diThH/hGgpyzKjcf1NDLxB
         lPSCaaGE7b39RDMYyPRx4IJ83/Pzjnq1r8g8aLsbKKzqvYR2NotVwZcMAoXdPEIA5s/0
         gVY4dClOZ9HoT8EcL7qI06XzMIOgG3apTtJmf55kWFXKAkWz3BqSH5azAU7qNGeQqnqb
         jqgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBGgc7cRLrfhb9YzqAtbD6bzVgxvrNAnbI9Te5wcEtunWFZuaRQrb1ndzkPHD2XyfuMVOweL76ns0=@vger.kernel.org
X-Gm-Message-State: AFuF++m1JDuo791//ChA0YeHJVuKcJQ+CORRxu0o5XZXOY3XMn24MIyy
	Zt2IWfXRfkpOxbBpMIdECapG60OsPiTPHtvT4UXFQocWfg40M6wW5kNl2k1GSOcbRRNc8beMdxg
	lI54aDWk01ZqxlxYyWv9xIGI1HzKKq4o=
X-Gm-Gg: AYBFou2ySfGaPnE5uN0D1Qj+qfHo3MEhP8CBtRzIkjTAGxmghtE3s55dTiWwiRh5ydp
	zxTIqk4o6CXW5ZJLNJk/lAWPwJ2Iv8Rq1ZmJHyC4Jzbu43exP9PK5l0Xae9RG/QXjD/jmX5MGB8
	5Ti/vTlQn9K+hie5JdIiBD6JABGnM+SV6Bbj8+3/MkmXVskJJuKwrAhK4kczXChKGYLYM61MzDN
	6xxLMS9OA2CrYD3IOAHlSOxpNRc35P7vcRRtDmYJ+ktSQKduzyhgAY8fFbSfbTL7kw/XrogOY5y
	RiNWc/mQ+A6kf3kc937dT2vhsFqGGdj0dSgyenNNkjylAW6nBfEJ9DU4
X-Received: by 2002:a53:c847:0:b0:66d:14db:b5a4 with SMTP id
 956f58d0204a3-67182e32973mr6312973d50.1.1790080509741; Tue, 22 Sep 2026
 05:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922120330.127262-1-itai.handler@gmail.com>
In-Reply-To: <20260922120330.127262-1-itai.handler@gmail.com>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 22 Sep 2026 15:34:58 +0300
X-Gm-Features: AclHuK9M1FiHPYW0MDamOqCGXrHsZodxWnPTe6_1DsJAstTJCmij7YJNysXMWIE
Message-ID: <CAFpOueSSGssTvQ6q2q-piK4uzdaoUQBvtU4H_yjvN7hyfVa0uQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:04=E2=80=AFPM Itai Handler <itai.handler@gmail.co=
m> wrote:

> A patch doing that is posted:
>
>   https://lore.kernel.org/cryptsetup/20260922100554.28692-1-itai.handler@=
gmail.com/
>
> It is not merged yet.

That cryptsetup patch has since been declined, four minutes after I sent
this series. Correcting the record here rather than leaving the
reference dangling:

  https://lore.kernel.org/cryptsetup/d3823e0b-3387-4b3a-b5e8-a3d5f266308a@r=
edhat.com/

Ondrej Kozina's reasoning is that the missing upper bound in LUKS2
header validation is deliberate: bounding it would stop an older
cryptsetup from even dumping a header that a newer dm-crypt might
support, and the corruption case is already covered by the LUKS2 header
checksum. Both points are correct, and I have withdrawn the patch.

It does not change the position of this one, and it is worth spelling
out why:

- cryptsetup caps the encryption sector size at 4096 on every path that
  *writes* a LUKS header, and this patch does not touch that. No tool
  creates a LUKS device above 4096, so the portability of what
  cryptsetup produces is unchanged.

- A LUKS header declaring more than 4096 can therefore only come from a
  deliberate edit, and as Ondrej notes LUKS2 metadata does not protect
  against deliberate harmful edits in general - changing 512 to 4096
  breaks a device just as effectively.

So the paragraph above should be read as: this is a case that requires
hand-editing metadata, upstream cryptsetup considers guarding it the
wrong trade-off, and I agree.

Two remarks from that thread bear on this patch. Neither is an ack of
it, but both are worth having in this thread:

  "There may be support for larger sectors in future dm-crypt."

  "Since dm-crypt constructor currently stops you from activating such
   device (w/ sector_size > 4096), it's ok."

That is, cryptsetup deliberately leaves this limit to the dm-crypt
constructor. This patch keeps it exactly there. It only changes the
limit from a fixed 4096 to PAGE_SIZE, which is the bound dm-verity
already applies to its own block size.

Itai
