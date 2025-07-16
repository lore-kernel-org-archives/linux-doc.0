Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209CA2853E3
	for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752643937; cv=none; b=d95qLMZ8iCMb/Fgrramgfj9acV2lMjeUwzpl/9NDDouOgsRyBserl10gsUNwPvQoFEXc+f7Gyb0P2OV+TLCN6vpMWVnPozK8hT7dbYo2G+2qYuHl0LS02HiprS7Ke04dSmXIvOy7V5oOg1HnfhtvawS0th3mcTeZqKbMJfiOSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752643937; c=relaxed/simple;
	bh=87KcNmcNCfKzd5C+FHrTqadt2gHiOHzdg+/afSRwOF0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iMntEY+XE/EGEM51kymJmvWPDbAv2zb/YS4ClfSSdUI1+DHRTXjXjx5066XgwluCDa/fq40H7+iinpjABkoRb+DYT0OsQYhhE9TsYav6gGO+3N7XLzVGcE8f/bWdQ/VbARDXj4JqYhHVO8/a7FBXcFfJC3M7ke3Y6GCw7WDOHQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=MxPt2qmI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MxPt2qmI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7490cb9a892so3774030b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752643935; x=1753248735; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCMRUZQFGpcymBqkIe3rm+bYJxEBRs5oUHZ2hwPslEg=;
        b=MxPt2qmIQ3cyHTHNB7LRPfD3GyJ0/gKnj1/ODxFtfG/jftKCPbF+uOl5SLrVNsOfqx
         PURLfr2XEWkGweRWT0OQylLQhqm7ZqyrF9TIiGX1aRijWHIsNWU/uqh5qguQMZS9vYaY
         XbXJtq/YElZVf2w4+aGruBMCQ6xLaOXyQ1UVyKfjc3PjSvZs7tIooqM0nteo9s8k8M2+
         M5iV4kHpxtuwJAy+eBZUPro0DnhzQRvHh4BmnNvTk0Hb4EhGvIRk8WCvdYIQky67n7Hk
         /jNRk/IOWFHQGH+O5x6IZUqX1wpQbPwzEWTPTE5Wsevd4Byxu6nTJwJlkiTrruEZrcbq
         /AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752643935; x=1753248735;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCMRUZQFGpcymBqkIe3rm+bYJxEBRs5oUHZ2hwPslEg=;
        b=k/UG1BmSQYh+SeH68MJy0bg3UQEcO1/5vlnty4GYPfYKb69wQ32XBZujvQ1ufToypk
         3ZIpGRbJbYyeX+xDXKG4JiMhSyt15I8pktb7llC86KcbTR1LN0yY81w9awr8pnvF/it5
         /qZuAH9Iqk1TZpI99PR2tq7cLxpRptNe4+w9cHcUt5zRXsIb39aiW4jfmx2zcPPvtq4i
         J8KZiXoz9sFsVW/daxPKSLfS/6NHxxVBWjP4voQnlpqOgSrFTyBaY5FtibO0ByXf/oOF
         kVhcIuqpwdELNg8+s6W6NNrA1WckF0uTxHLoA2rlSJSHyo6TQX1SFbflnurNJl36xq/W
         omXA==
X-Forwarded-Encrypted: i=1; AJvYcCXcYuSml485tNWPLeb+t31wTs1yhJvyaRzi1dMa0h4wt9FvtNGiavl6uXLt3PwL1ZQ6//WAa01MEKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uQdqnQI9P3n6wGsyIH0JTUGhtkjlkf9Bt2DfnVXn6W1AU67P
	ZhDC5ADf9M4OQwxDvFdPz26rQSDIMGLuvW33mrfHOxcYrFm1N3Kbrc9kWwA06+RFDM4=
X-Gm-Gg: ASbGncvPswUcFMspaKn3akFvYVgxp0pFHdVtXzlcgTdSKSlp3cRSLJplcHX8D2mp3sQ
	e3w19RFBZbAQWCp9HI/msdnsA3QdoA3EP8/sz4aaL/2wYHrZ14lzN0KTajM1rRC0fSAm+vX3uFv
	mE1TpIyCkCT75vGCCwu2DgS0KCdBY2uDxuGBrRw7gFNIx7IxzW5ge2biUTkwSQY0TsTA/wkBgQ+
	7adhEj97NoZD0NhLopOodL18UMFDDuANGo3BO+Nu7Cc8tNR1ArDGamzNxg8aRgZ5pZ0Wmcy4POS
	MQ/P1npLpEh+FY1mMu0u+eCGrSTDaYCjC7C3uXqs6XVtV9khb4gv+9BeFdHTV0CtbK0jP9925+n
	8Z4rAn5hdUD+qPIK84Ts=
X-Google-Smtp-Source: AGHT+IGzq1EuT7l9xYvVOR/aL8LMKVAB7h0jn6W/ldNNUwCMMtMkTDWuR5Zq3zFKgnv8U+oOw6+/dA==
X-Received: by 2002:a05:6a00:887:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-756ea8b5c61mr2671787b3a.21.1752643935242;
        Tue, 15 Jul 2025 22:32:15 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5a9fsm13908822b3a.11.2025.07.15.22.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 22:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 23:32:12 -0600
Message-Id: <DBD8F7HINUHO.2487OZTDLKOWQ@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated
 MIPI function calls
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-2-me@brighamcampbell.com>
 <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
In-Reply-To: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>

On Mon Jul 14, 2025 at 3:46 PM MDT, Doug Anderson wrote:
> Hi,
>
> On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampb=
ell.com> wrote:
>>
>> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
>> functions in order to facilitate improved error handling and remove the
>> panel's dependency on deprecated MIPI functions.
>>
>> This patch's usage of the mipi_dsi_multi_context struct is not
>> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
>> of panels with multiple MIPI DSI interfaces. This panel is an oddity
>> which requires swapping the dsi pointer between MIPI function calls in
>> order to preserve the exact behavior implemented using the non-multi
>> variant of the macro.
>
> Right. We dealt with this before with "novatek-nt36523"...
>
>
>> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
>> ---
>>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
>>  1 file changed, 59 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu=
/drm/panel/panel-jdi-lpm102a188a.c
>> index 5b5082efb282..5001bea1798f 100644
>> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
>> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
>> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel=
)
>>  static int jdi_panel_unprepare(struct drm_panel *panel)
>>  {
>>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
>> -       int ret;
>> +       struct mipi_dsi_multi_context dsi_ctx;
>>
>> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to set display off: %d\n", r=
et);
>> -
>> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to set display off: %d\n", r=
et);
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>>
>>         /* Specified by JDI @ 50ms, subject to change */
>>         msleep(50);
>
> Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
> commands caused an error.
>
>
>> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", =
ret);
>> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", =
ret);
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
> I think you need this here:
>
> if (dsi_ctx.accum_err)
>   return dsi_ctx.accum_err;
>
> ...otherwise the code will do the sleeps, GPIO calls, and regulator
> calls even in the case of an error. You don't want that. Then at the
> end of the function you'd just have "return 0;"
>
>

Regarding these two suggestions, I prepared this patch with the intent
to change the drivers actual behavior as little as possible. It looks
like the original driver will happily msleep and try to continue
initialization even after an error has occurred. Of course, using the
_multi variants of mipi dbi functions kind of implies that we want to
stop communicating with a display after an error has occurred. And
because all _multi functions are effectively no-ops after an error has
occurred, it doesn't make sense to perform the other half of the
initialization sequence while anything involving mipi is dutifully
skipped.

I'll make these changes in the next patch revision.

>>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>>                                        struct mipi_dsi_device *right,
>>                                        const struct drm_display_mode *mo=
de)
>>  {
>> -       int err;
>> +       struct mipi_dsi_multi_context dsi_ctx;
>
> I think you should actually pass in the "dsi_ctx" to this function
> since the caller already has one. Then you can change it to a "void"
> function...
>
>
>>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>>  {
>
> I think you want to pass the context into this function too and make
> it "void". Then the caller doesn't need to check for the error before
> calling it...
>
> Then the "msleep(150)" after calling this function can change to a
> `mipi_dsi_msleep()` and you don't need to check the error until right
> before the LPM flag is cleared...
>
>

About the suggestion, "you don't need to check the error until right
before the LPM flag is cleared...", if I change
jdi_setup_symmetrical_split to accept a mipi_dsi_multi_context pointer,
the driver will output "failed to set up symmetrical split" even if the
error was encountered well before setting up the symmetrical split
(meaning the driver doesn't even try to set up symmetrical split at all).

The appropriate solution will be to either maintain the error checks in
the driver, or remove the print statements. For the next revision, I'll
simply go ahead and remove the error print statements because:
  - the mipi _multi functions should handle error printing well enough
    to facilitate tracking down the particular mipi sequence which
    caused an error during probe/unprepare.
  - less logic in this driver makes it easier to maintain

>> +       struct mipi_dsi_multi_context dsi_ctx;
>> +
>>         /* Clear the manufacturer command access protection */
>> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>>                                    MCS_CMD_ACS_PROT_OFF);
>> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>>                                    MCS_CMD_ACS_PROT_OFF);
>
> All the duplication is annoying. In "novatek-nt36523" I guess we only
> needed to send _some_ of the commands to both panels and so we ended
> up with a macro in just that C file just for
> mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
> needing it for lots of functions.
>
> Maybe the solution is to add something like this to "drm_mipi_dsi.h":
>
> #define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
>   do { \
>     (_ctx)->dsi =3D (_dsi1); \
>     (_func)((_ctx), _args); \
>     (_ctx)->dsi =3D (_dsi2); \
>     (_func)((_ctx), _args); \
>   } while (0)
>
> Then you could have statements like:
>
> mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
> jdi->link2, &dsi_ctx, ...);
>
> I _think_ that will work? I at least prototyped it up with some simple
> test code and it seemed to work... What do others think of that?

In my opinion, this change is absolutely worth making, but the creation
of a new macro like mipi_dsi_dual in drm_mipi_dsi.h is beyond the scope
of this patch series because it has implications for panels like
novatek-nt36523 and others. It looks like you've already effectively
completed the work of implementing the macro, but I'm happy to address
the adoption of the macro in lpm102a188a and other drivers as a part of
a later patch series. Besides, there is no more duplication in this
driver after applying my patch than there was before.

Of course, maybe that's just me being pedantic. I'm happy to include
mipi_dsi_dual in this series if you insist.


Thanks for the thorough review,
Brigham
