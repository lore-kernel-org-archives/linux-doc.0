Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11873B6375
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773356252; cv=pass; b=jIUuX4J9hLxzAWYb8678PpT5pd8lXCsUXie04X1RyI4n+d63yIZIoWRk+5dO710nkID1F/fzUPPlAP6Xw7NQ38Zt+h4cBrMZi4zMTNLyiEjv+sup45KakYKCmFP/rjqqkyYHJ70Kq92SflFiQbXlDfJC8km8XC8sR1xdYDmQbyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773356252; c=relaxed/simple;
	bh=zOgRkQnNB/+Ntg0KnD677Eyon1mNQy4poFFpVwIyOcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+8D9uvRk+KtYDWxe6MOguIkfeO3fonDfbFF7BxAcmVh2ZU32LVf6Sc6cPCjYP8x4E1cWFdTS3mz9kfM+TLjKcB/TYLA0Z53p54eSW+oMjKbjj1T13DO194jifzqCE4BWcnQeaDbu6VKFdcAU5ye6SalAMTFHHi2Cugui8vruE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7apzFEH; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7apzFEH"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cd830404c2so160163785a.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 15:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773356250; cv=none;
        d=google.com; s=arc-20240605;
        b=IVJiyCRK9KwkRjI0aXgbLMwTpY57Tkb1AeuPPawMB8oLmXxs/UDveN0rZEOXKNvgvb
         fcjhheY7DORyUYJIMbKBPRY9jv0t06te3VtSwQZQdwFyE83eJMsKOywDuHPMinZSYgRg
         qY1eox9KIxgODc7CQQLz9Xt64yq81mVNJoR50BKRk9HZ6aVtw8QZs8flpxQ53kBysliC
         yD1zJsEfDeKaAhG8l6MH3bNSXODQ4eqJAeU5Lw2Xg5S5N9ooZlxk0BII2H5A+qrm/eeH
         7/uVF6eihTH6omaIbefw4caAfK/DQp1gRBY7I4mjPKn+t3iaCL/vtD+qLsnb+vtUa5XP
         bjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CFgglb1Zf4C09vLpT2zlrzPR5mBWBimjznIcvEhPlMw=;
        fh=rnlmuzxqqD1/7D+O+PJgnzuacfdzbZ7zFNKwsaJioa4=;
        b=kDIPyd8yvimI48QnkhRnvyUr/gmHncLh/v9HmpbirMc2nCeeJc0WPmOCqWz5q4kmTC
         Qdx9sY5gkSI81TfyTNVoTtIXmBR2iRrWjYsDaL9Q3/a6NCrFVzZg23alzjsvDXN5ilbn
         631kucxT3vxjsllZayf55cVpvi0pVFpDUicNf91OoxpFwfE1gxwhtJ7NMWrjiGE3Ou61
         Ct/enl3DSzm8XaSrRe33FsqkDrxOVFYtNf3QxH+5AgkIzalCesn4tg9veOWhKMJ1hheK
         I/fnxaL0Jf+I9brac4aCKvYSSDF2IBcjf507KJ9ywuRYvMM9ZIHw48wJsZdSUQZvE3H0
         XEYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773356250; x=1773961050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFgglb1Zf4C09vLpT2zlrzPR5mBWBimjznIcvEhPlMw=;
        b=T7apzFEHZqDG3eji3TWOe30IYSv1LuT9JC+rhFG5PLMQC0iRcn63ha2jfFOQvoeYJa
         9xlJjpdgvsyzKMlDl4n143np6AB7PnIzaGGqg7XD2gXiqmvfF3sJLUBANI+MP7REhlHu
         6JbOkcxBM7MxpCTIcDFQgxMxDTHDg2gZZLokTQ344VtMk+2vsfvD7G/zsafGsPnizoHe
         pAbvVpFB53Be0yl4wgiEXMrz0RmBdIXbsHCaPXe1vljNSQQJPNzFo5cBk2+77WQcAPDt
         HfUxleRRoGi23OA1KsSg6X3g++nEUJuwWepLn0LO3kBXME8pd1KJZhB496UznHKhb8Wh
         8WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773356250; x=1773961050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFgglb1Zf4C09vLpT2zlrzPR5mBWBimjznIcvEhPlMw=;
        b=eSAoAoc6/7O6hGKG4IZ5X4QXkZn0wV+/BBpqgmkROrqgsoi7UGNg/6gIaVHjQ5mEHC
         ZBy29WmKrVhDqKmzotxq8ypOn9lV3CXg7BFV2HAo3e8A98MoDv9V7GjdMqiTLIk8cQzp
         lYpbaf0Z8ykQ/ju1H0II4TxCcB5Gda1dtbfC1jpdTxzRMUvkEdPzIoVmpOzqcglAUhf/
         9aYA1PUt+T2myPeovPv512QPXLe63elQAxtngnC8pf+zMuL3n3dx9a50tzpyENr1BGhy
         85+DFvxGDInbjo8P57wZHHs4T/zXdGHSPwaem0fyWfJwP/0PiKhCv9EG02iHtCk7/2RA
         uFoA==
X-Forwarded-Encrypted: i=1; AJvYcCV7NYe/USETWMRAbwg/WVNYuHBtDa0GVVyK2a1hj767Tnyy2ynJ3fWv2oIExpT26P9HREovokSUHU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHF9Y5JDZQuoMql4ybedj7u97NV+CXhANENkiVT4k6yYJxHF/9
	zPEzH6cZZyFBn1T5ijj1HElFjLiitHZP94J9wXjMKULVjr9BrGKo2K9EhofP2ef3Yib346pks47
	jZeu7vz/0+RajSGvHmBXWAcG4foME9h8=
X-Gm-Gg: ATEYQzz+649sRFXX8/M1ARG5nM/ORSVu/A8KTCVdlwaOLMJQazhUMYi1GgQehxQW1A5
	NGlEJCmT7eYLL9QX8fQWko1X1Hcg0LJ5zJSvkaDoKhi94bQdpAHGEBus1upoP6/kQjhwjhw4ka/
	TVp7s12RkR7kgVqAbqc5JaEyxoFgqRlmSYRZVV1AA599DHxlk4AJW7o58T1AuHaQR+hS7JiYgdt
	KSsBgdLU/EnqlIz0dsWO7VaY5Wi1CwMwM6ngpM6g0S9jeoW/eVYb6x5RKhKFHBzq6blUTPnPx8i
	NhrfYhQ4NtWDMuN5WfE=
X-Received: by 2002:a05:620a:471f:b0:8ca:2a02:dfd5 with SMTP id
 af79cd13be357-8cdb5a709e6mr202126985a.30.1773356249805; Thu, 12 Mar 2026
 15:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310072937.3295875-17-derekjohn.clark@gmail.com> <7dc9bd14-b21f-461a-9794-070f43db4826@gmail.com>
In-Reply-To: <7dc9bd14-b21f-461a-9794-070f43db4826@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 12 Mar 2026 15:57:19 -0700
X-Gm-Features: AaiRm50DBo-3LxvMfUFcLMN_dcSC89X0sTH-eHWjKkx6AzFjTRQNvObMpScb3gw
Message-ID: <CAFqHKTmBBEHJgypooELKa7fU3oELnVk7bjfZwHsFD9Y0b1c3Xg@mail.gmail.com>
Subject: Re: [PATCH v6 16/19] HID: Add documentation for Lenovo Legion Go drivers
To: Akira Yokosawa <akiyks@gmail.com>
Cc: bentiss@kernel.org, hughsient@gmail.com, jikos@kernel.org, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com, 
	mpearson-lenovo@squebb.ca, pgriffais@valvesoftware.com, shaohz1@lenovo.com, 
	zhangzx36@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:44=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> Hi,
>
> On Tue, 10 Mar 2026 07:29:34 +0000, Derek J. Clark wrote:
> > Adds ABI documentation for the hid-lenovo-go-s and hid-lenovo-go
> > drivers.
> >
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v3:
> >   - Remove excess + from every line of patch.
> > ---
> >  .../ABI/testing/sysfs-driver-hid-lenovo-go    | 724 ++++++++++++++++++
> >  .../ABI/testing/sysfs-driver-hid-lenovo-go-s  | 304 ++++++++
> >  MAINTAINERS                                   |   2 +
> >  3 files changed, 1030 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-g=
o
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-g=
o-s
>
> This (commit 168c91839139 in next-20260311) causes a lot of new warnings
> in "make htmldocs" such as:
>
> WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /<=
...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /<...>/Docum=
entation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
> WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 tim=
es: /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /<...>=
/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
> WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 =
times: /<...>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /<.=
..>/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
> [snip]
>
> Please fix.
>
> Thanks, Akira

Akira,

What would an appropriate solution look like? There are two separate
drivers in this series that are modeled to provide a sysfs that is as
close to each other as possible. Because of that, they do end up
having identical attributes for many of the implemented features. In
most cases they are prefixed in the sysfs by a different component
name, but that isn't the case for os_mode or touchpad/enabled. I could
combine documentation for both drivers and de-duplicate, but I'm not
sure what that would be called, sysfs-driver-hid-lenovo-go? Add them
all to hid-lenovo docs?

If I do that there are some additional de-duplication that could
reduce the total number of lines. I.E
What:           /sys/class/leds/[go|go_s]:rgb:joystick_rings/effect

Would that syntax be alright? Some of them get a little excessive, for
example the auto sleep time is defined three times and would be
combined to something like this:
What:           /sys/bus/usb/devices/<busnum>-<devnum>:<config
num>.<interface
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/[left_handle|right_handle|gam=
epad]/auto_sleep_time

Otherwise, is there some way to flag the same attribute defined in two
separate documents provided by two drivers as not being duplicates?
Thanks,
Derek
