Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549164;
	b=ZgyWZikoVPmSOC241lvMmSS2b9jInroJfknywM8lFEBOGeZ0rveIZXN8dmUjH4T/Kj5x
	 7igAf8udAjaSuVfgl+NVJwmPy41XJQzj4HM9pYujf0qT2fx1tyINH+Tw79bspjCP/9pHC
	 IOTN26gVg7U6KJntO+LZKAsF0Xat3N/hpRIQQFuozDTWZE/0unpBq3/bN3nn/PfPboIam
	 x8OywfCHwBcvcEmvQeyouxnJ93T5cdK/pi9ld7c6Nb60vGdCJw4mKMBgOsrijLs3FbsXK
	 OsILviWfNLGUPV4fCK/Not/4x3LQE9WYnRs4GDewwe2Itbgoa07MDMv+Xsr4M6vlK4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
	b=5CI5NOUOjwa4wTr6X/XEfY1oegIjp6sgQd3dXOZUmT91KBo+dKoIc9OgxsWtAzdHU0KU
	 osFOWVOUlV200VlL+tJj3WllSftSDfzFQnDQqsEnFXzI50y6niwxhKxc0voJggrtTEqzp
	 jNzUJ+OEMqIOHqFaOnGw3VrJMpFsvzgT+At8rE6NekLKZL8WU7QYYzTdbz+kkUWkSn1I+
	 E2yluT2RF+pA6OjHVRZG+ISjmrDwIdVyzhevETbLgblalxB0uZJWgQN/5MiqtBX7Un2ao
	 0/gEDoH2TkWIvjR/a+6WwsB9gDMvlTwEaWWSTGZizcyXkRcdAv5RFqVhGXmkIoicxww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cW2rwNVJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC41A606A323
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 19:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC41A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cW2rwNVJ
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9214032a2fdso40116336d6.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 11:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549163; cv=none;
        d=google.com; s=arc-20260327;
        b=kz3QlNJI9R7LnHn02xXYZ5UPLJbMMwScb7zqNND0LCNm438GDqr5wHSluu5+ipF4Op
         KF6qCOB1wDnxufyzWYsSMWikMyUDHd7MEWm9GErx1le4NcTGcL3MYz4Y3WezKXolELNv
         iGABRla65V/BmhPpzoBkuAzWa3vYb7zr2Yt3buFX8HRuQK+3WvHQn+vVyIQgveqdi9Xp
         INh1DlQRZZEhYy0UQ5jQfV3LAM79ZY7fsQ5spbILOF3yYAXJHuj+AIw3J9DE/mlHM9OI
         tLNDdDCsR3wHoTq+hOQHIW862Zu9bjWFj4x9J77ArH2N/z2H7L+zNxkUnZ8CadLQN00U
         EezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        fh=+lC4j+6wjn6+19QVN7vHJOOYUrZyCsgQY9szq++2ENM=;
        b=sRCyquSLQDlek/gADZx9H5bUWgSwdvyZ4HF+J7HCLHcmXHOf8+CS4nuVLjtnHG39Ff
         e5CS9vN/m/zEOaPLrJE+MRS8ikvypxdoZemsgAPZ65VKEF9cx0prPgMxUUcxPWPPjNS+
         p4XL6KRaiXuC6hIBKWOt0Ur083QZjpLpFloWnJagy+xwn9TuAELWG1wZVXihkDMlSnLd
         bUx0ftHaWkGLLvd/kOX6nrUWOUd1lfmLQlleytgticBLu1C7BPd/vY/Oc9VsGuBw1+dc
         44H8Z1FvGuNfXBu1fWD4cNJaPUgTqNU0ezaECK09YELnT/0toqJYL7nF78GMCwaaFxse
         lJlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549162; x=1796153962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        b=cW2rwNVJI6HxHt+wItMR2czZyFM8ow0B06BcI45fbba+VQFvn1Z0TXpWSTRRWCwRZe
         8T60OJmWcm5C+mon3iZZDG6m2QDYKL0T1i8+sFCuPN0jVqjgomqe3HEQSH9fXycJ+GG9
         alRSQ4xAVZwqaC/6LzbYEREJ0M7v+pMFEguNQs4Qwq7HONhVTapJ/XnaQEZgsMn/P4SL
         aA6rG2RZG5qRTRrQ+4C/uRkiS1FSOIwgFHPuU8wi3u69EWkim6F7ZHAZzD6gnPLaZdrl
         BxKkIaD+i9B1PaXiYnydaY96GoTsMjJkvMnhAXVtuccblVLlQVvz5p9cLpKDEJ98Q5pk
         pszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549163; x=1796153963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        b=QKchiPPVd/B3nTf4eHXeSg7BDuyr9Yrk5rso2LjTUHKREB6fpl5VhaVrfIqm2xRTWf
         smTJLCHpqcBb5LGt/OzWFjR0iGtA/vPCx1ZgLMvHPrJ4sd+NmGrPNTBxLJfmBC86g5n6
         qWU/DfgeTGpzRPyxKMd4EgjLhAYOnFnQQe3peCPkaRKvbVxwufp37oJqVesfGuJy+RwP
         S94CFJFZtlTcy7vQLj6vSHMdjOsdPsN+YJVmNwekSnIZ2t+astnZ801o8JYadVPsBdIX
         7jVlktGQm5Bie1Ejx+MfBfryYi/m+V7c2fxEfKvBTrubLB9KCYfXCrzi23uaCYnaWJgE
         WPVg==
X-Forwarded-Encrypted: i=1; AL+hErFncgii/yjPSERHJFw8jujzL2hfwg7Dgm6l7KOAjeFcrqbgJT+YsTvoJHRdEFW9YzgVaRrY8hUCPOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qUZOO1J6x6E05tnyoA+9A7AGS7a9eLZ2VAdaUa3fsBETc8XTl
	Qj2IN+VbeproYu2mCv2yVbdHltjBV4/NaL8Pxvohb7ewcnRvB/tMqP3aoFcDRchikpojxkTt4J5
	tQitbu0gxUr0YEGr3/EuCDO2NmMqfQ64=
X-Gm-Gg: AZFdTZe+Z4W9OSG+VV8diOo5+y674KnV4ZzR1JRkGt16HIIhYcjcs9xoRjUcZoEcWt7
	iOgZBk0IBW0omOclpJDd4p550gJzruWlCMyuFgpqMjCRTSBiRUJ7a8cNY36Y5kHFyQR+Yz6Dqzn
	NebTt34xJF+ltUulSgVror9QsMwbyB9jKJs23+mkhGvhZ3qeFP438RoDa6kZwwh93pPxjpK3FgP
	UZ2B25BnNjkH0Ng1AXIW10OABqrTBBt+dfKd9KSdAmzK2obYBtzoXnxzdkq6fZvTddIhxOCbIGh
	XYyoa670eS3fukQ8ZPiDhsXePmZmEeD+ZDiqBy56Qjb3Hu3mkME+19NpbklpsSh8SKcxQeVy8hW
	TDPuExIXlY7QAYpa8tMjbbMXWbRlXma61+SqY
X-Received: by 2002:ad4:4ea5:0:b0:921:2a52:7961 with SMTP id
 6a1803df08f44-92134a69adfmr276073706d6.11.1795549162306; Tue, 24 Nov 2026
 11:39:22 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <20261110020632.4003499-4-svv@google.com>
 <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com>
In-Reply-To: <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 24 Nov 2026 11:39:11 -0800
X-Gm-Features: Aa3M54o2OOpleRkrCFNEdlqQD3MYtqXEWF3YvkJU9bfSOLKz15MuchopzE_T5qU
Message-ID: <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist
To: Siarhei Vishniakou <svv@google.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:29=E2=80=AFPM Jason Gerecke <killertofu@gmail.com=
> wrote:
>
> On Mon, Nov 9, 2026 at 6:21=E2=80=AFPM Siarhei Vishniakou <svv@google.com=
> wrote:
> >
> > Historically, Wacom tablets reported stylus barrel rotation (twist)
> > via ABS_Z because a dedicated evdev axis did not exist. Now that we
> > have this axis, report pen twist on ABS_TWIST in addition to ABS_Z.
> >
> > Keep reporting ABS_Z to maintain backward compatibility for existing
> > applications that support Wacom devices.
> >
> > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > ---

Still waiting for the requested inline comments, but in the meantime
I've been able to test and verify that the code works as expected:

Tested-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> >  drivers/hid/wacom_wac.c | 35 +++++++++++++++++++++++++++++------
> >  1 file changed, 29 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 614f2adab563..7676bc26a027 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -802,8 +802,10 @@ static void wacom_exit_report(struct wacom_wac *wa=
com)
> >                 input_report_key(input, BTN_STYLUS2, 0);
> >                 input_report_key(input, BTN_TOUCH, 0);
> >                 input_report_abs(input, ABS_WHEEL, 0);
> > -               if (features->type >=3D INTUOS3S)
> > +               if (features->type >=3D INTUOS3S) {
> >                         input_report_abs(input, ABS_Z, 0);
> > +                       input_report_abs(input, ABS_TWIST, 0);
> > +               }
> >         }
> >         input_report_key(input, wacom->tool[idx], 0);
> >         input_report_abs(input, ABS_MISC, 0); /* reset tool id */
> > @@ -981,6 +983,7 @@ static int wacom_intuos_general(struct wacom_wac *w=
acom)
> >                         t =3D (data[7] & 0x20) ? ((t > 900) ? ((t-1) / =
2 - 1350) :
> >                                 ((t-1) / 2 + 450)) : (450 - t / 2) ;
> >                         input_report_abs(input, ABS_Z, t);
> > +                       input_report_abs(input, ABS_TWIST, t);
> >                 } else {
> >                         /* 4D mouse 2nd packet */
> >                         t =3D (data[6] << 3) | ((data[7] >> 5) & 7);
> > @@ -1411,6 +1414,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom=
_wac *wacom)
> >                                 input_report_abs(pen_input, ABS_TILT_Y,
> >                                                  (signed char)frame[8])=
;
> >                                 input_report_abs(pen_input, ABS_Z, rota=
tion);
> > +                               input_report_abs(pen_input, ABS_TWIST, =
rotation);
> >                                 input_report_abs(pen_input, ABS_WHEEL,
> >                                                  get_unaligned_le16(&fr=
ame[11]));
> >                         }
> > @@ -1935,7 +1939,7 @@ static void wacom_map_usage(struct input_dev *inp=
ut, struct hid_usage *usage,
> >         int resolution;
> >
> >         if (equivalent_usage =3D=3D HID_DG_TWIST) {
> > -               resolution_code =3D ABS_RZ;
> > +               resolution_code =3D ABS_TWIST;
> >         }
>
> Requesting a comment here just to make sure that anyone that is only
> casually reading doesn't think this code is dead. Setting *some* kind
> of radial axis here (be it ABS_RZ or ABS_TWIST) is critical to
> ensuring HID properly calculates the resolution for ABS_Z, and that
> might not be obvious when you see HID_DG_TWIST forcing the
> resolution_code to ABS_TWIST.
>
> >
> >         resolution =3D hidinput_calc_abs_res(field, resolution_code);
> > @@ -2332,6 +2336,7 @@ static void wacom_wac_pen_usage_mapping(struct hi=
d_device *hdev,
> >                 break;
> >         case HID_DG_TWIST:
>
> Also requesting a comment for this case that explains that the usage
> here is mapped twice for backwards-compatibility, and that the order
> matters since the latter call will override `usage->type` and
> `usage->code`, preventing wacom_wac_pen_event from automatically
> emitting an ABS_Z event.
>
> >                 wacom_map_usage(input, usage, field, EV_ABS, ABS_Z, 0);
> > +               wacom_map_usage(input, usage, field, EV_ABS, ABS_TWIST,=
 0);
> >                 break;
> >         case HID_DG_ERASER:
> >                 input_set_capability(input, EV_KEY, BTN_TOOL_RUBBER);
> > @@ -2522,10 +2527,21 @@ static void wacom_wac_pen_event(struct hid_devi=
ce *hdev, struct hid_field *field
> >                 return;
> >
> >         /* send pen events only when the pen is in range */
> > -       if (wacom_wac->hid_data.inrange_state)
> > -               input_event(input, usage->type, usage->code, value);
> > -       else if (wacom_wac->shared->stylus_in_proximity && !wacom_wac->=
hid_data.sense_state)
> > -               input_event(input, usage->type, usage->code, 0);
> > +       if (!wacom_wac->hid_data.inrange_state) {
> > +               if (!wacom_wac->shared->stylus_in_proximity ||
> > +                   wacom_wac->hid_data.sense_state)
> > +                       return;
> > +               value =3D 0;
> > +       }
> > +
> > +       input_event(input, usage->type, usage->code, value);
> > +       /*
> > +        * ABS_Z was used to report twist data, because ABS_TWIST was n=
ot yet
> > +        * defined at the time. For compatibility purposes, also report=
 twist
> > +        * via ABS_Z.
> > +        */
>
> I think this comment could be a little more clear, perhaps referencing
> the double-mapping in wacom_wac_pen_usage_mapping (and how we need to
> send data out of both ABS_TWIST and ABS_Z but that `usage->type` and
> `usage->code` can only be set to one of those two)
>
> Jason (she/they)
> ---
> Now instead of four in the eights place /
> you=E2=80=99ve got three, =E2=80=98Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can=E2=80=99t take seven from three,    /
> So you look at the sixty-fours....
>
> > +       if (equivalent_usage =3D=3D HID_DG_TWIST)
> > +               input_report_abs(input, ABS_Z, value);
> >  }
> >
> >  static void wacom_wac_pen_pre_report(struct hid_device *hdev,
> > @@ -3741,6 +3757,7 @@ void wacom_setup_device_quirks(struct wacom *waco=
m)
> >                 __clear_bit(BTN_TOOL_PENCIL, wacom_wac->pen_input->keyb=
it);
> >                 __clear_bit(BTN_TOOL_AIRBRUSH, wacom_wac->pen_input->ke=
ybit);
> >                 __clear_bit(ABS_Z, wacom_wac->pen_input->absbit);
> > +               __clear_bit(ABS_TWIST, wacom_wac->pen_input->absbit);
> >                 __clear_bit(ABS_DISTANCE, wacom_wac->pen_input->absbit)=
;
> >                 __clear_bit(ABS_TILT_X, wacom_wac->pen_input->absbit);
> >                 __clear_bit(ABS_TILT_Y, wacom_wac->pen_input->absbit);
> > @@ -3823,6 +3840,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >         case CINTIQ_COMPANION_2:
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >                 wacom_setup_cintiq(wacom_wac);
> >                 break;
> >
> > @@ -3835,6 +3854,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >         case INTUOS4S:
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >                 fallthrough;
> >
> >         case INTUOS:
> > @@ -3855,6 +3876,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >
> >                 wacom_setup_intuos(wacom_wac);
> >                 break;
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
> >
