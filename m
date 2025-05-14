Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0E276052
	for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225234; cv=none; b=JKwcXUZy/sN24XHcoXLWU7M9OzTWqIeqFwCcK6b6yziysoQ4Anx+/0ozBcyODQ7pEyU5I3TkNEpcBRGkYJ3GJtB+GSp0v3WERw3Is7TnI06VrYCaZlxFH2rZublKRzYy2FAgnPtcUaSyzYbtYLrQ7EFeoJ0AmXpQpdIDM9FcCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225234; c=relaxed/simple;
	bh=BA5SZ3wC3jmhfEm9JysGzS/LcnF5mjapcbHGPPq6knQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=aSAUd4GV3S3UyS23ibMKA82WTQwrt1K5VIXRSc2iIc4HlDlNQw+INrLdcMKr4FZlDOoVja91Y8Itz3CEXHwJRYtEDBdmzG2tiA5OM2HYUwDqpfOv1S50oQWb/3P9u6MUVjyQMoM1amJyoX1TVV7wHkJ62S1FdHvcILFdjNMEkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO8QX2GO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO8QX2GO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e7967cf67so8191845e87.0
        for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747225230; x=1747830030; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BA5SZ3wC3jmhfEm9JysGzS/LcnF5mjapcbHGPPq6knQ=;
        b=ZO8QX2GO1+63SKBwtO5hYFgYcmxzi9kVkYwutqBUv6zrvQPQVxO3YHZ3f2e7XjfxBY
         1goT/BTR3LpVuLnQnl/LujVHTMWHptJgadfxF3YJ3QDWftdVSHJNTwM6cF0F3pnDSbGs
         gDrYeUbvzPdxR5IM6mUkFOFD6aRRsiAY7he5kmOhWnd2IoJHBTKX7qvEBaAcbgmK8sht
         +5YwRnHoSdE6JcskB62Gl3EEzBoBookf/5EBtXWk4z6vIh4CkvKs4GKTEetQNXkbilB1
         H7WfBAffDWWsEgdHm+jxlesp3lfM3l6/IMD86WKAUR9ZSurTlNK9nTM6zMyOIfZ5KpSp
         cBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747225230; x=1747830030;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BA5SZ3wC3jmhfEm9JysGzS/LcnF5mjapcbHGPPq6knQ=;
        b=rg1g4U2UZgybvDzjgPa0OEqe4GstTtRle991wfsiSPoyVZWIvdEdaZyhFl7WyS/Gcp
         OIiQVWiXCh5p7U2fqvNQvlFdBIUsSu+1QM7QVwd6e6FUBkEmyrwBH1TODUArmkWJ1hb0
         Bd49cblyfO4AYerUDhWV2ik8MZSdAdrq9Q0ASzHP2kIU9KYsWDEdBfAMhc/lh0NiX6T5
         Z96lJRjq52AuKILKcgNPcaQZayCQyYB+gtvwrFhjKFART1he/Itwpt/QQWbMDIzphhPm
         DVpJMSCr6fF8CLvnHH3odOmZwKQGciELvH2z8Vb3D77adW9BlJBBbPRNR2x8odnpgQXM
         RuvA==
X-Forwarded-Encrypted: i=1; AJvYcCV1oOWosILTenPiohEuYO43ersA9MtMYyyzBwmhnFNtKBTuQWWywvLt1NOBcTGdaiQEoKXG7O/ZB4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZPVwK6LTvTsZLuo54C+ePkSgAUPIUP/ZYFzfYCfDk5rljSJz
	JQqj9mvg/K6lbQX+Z3qAiQgnmqAOkWyHYMsc0efRmbnOV+e/l3byBhtLoTemBHF0xNNa/vl7CKz
	uhvq0lyjWSrYQvHTvQo4rSzPRfPyk0BDyW4k=
X-Gm-Gg: ASbGnctnFVtDjbBjwYvA3tz1FOxJDTZyLTGVTevsQq12KkgG9I77/j+pfB8YZQ92C1P
	l/2H+Yi9EWIwHP01VYNYQ8jJmYHEewyWGAuTyG9t3YF1rpxoTDHcGE5CiXOw5JvwIXX2lgIfpWR
	JYGs6UXk1jk0Bq4ptt10bJxOmpw4S7BCy/13+JVAhsWDf0njImKvelBl6cFAXipXlvENDTTLA=
X-Google-Smtp-Source: AGHT+IH+U2JpekCH/uhsvxKzKKmt4U5sjHIIhV0kDs7su1I514NofSEKeqRXF+CjUWQvRT1oOz3FqjsjKKVDmjFYcrA=
X-Received: by 2002:a05:6512:258c:b0:545:f9c:a80f with SMTP id
 2adb3069b0e04-550d5f7c394mr1128152e87.1.1747225230148; Wed, 14 May 2025
 05:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALFiBubTwgdQ7W5voXbry+D0Us8fsDAkkAr93xrRrT7Rk3tueA@mail.gmail.com>
 <CALFiBuas6B0LZWsW5oeKeAKmT1XqdSSEaR6EH8YkRpeuEd3C7A@mail.gmail.com>
In-Reply-To: <CALFiBuas6B0LZWsW5oeKeAKmT1XqdSSEaR6EH8YkRpeuEd3C7A@mail.gmail.com>
From: Shivam Sharma <10sharmashivam@gmail.com>
Date: Wed, 14 May 2025 17:50:18 +0530
X-Gm-Features: AX0GCFuXAfhZYMJlvTkz1HsuzmOjb_oEUoBxd7blF1fYy_SWm-ySsgjdy6Pv0v4
Message-ID: <CALFiBuYqEocqYL5=59osNXORuzgpQk=7kJUSC=tajRynW_R6yg@mail.gmail.com>
Subject: Re: LFX Mentorship Task Submissions
To: skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000002f9c750635179351"

--0000000000002f9c750635179351
Content-Type: multipart/alternative; boundary="0000000000002f9c72063517934f"

--0000000000002f9c72063517934f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the 2nd task (Documentation task), Please Find Attached .txt file also.
It is the same .patch file, just different format.

Regards

On Wed, 14 May 2025 at 17:45, Shivam Sharma <10sharmashivam@gmail.com>
wrote:

> Dear Shuah Khan,
>
> PFA 2nd task- Documentation task
>
> Regards
>
> On Wed, 14 May 2025 at 16:45, Shivam Sharma <10sharmashivam@gmail.com>
> wrote:
>
>> Dear Shuah Khan,
>>
>> I applied for the Linux Kernel Bug Fixing Summer 2025 LFX Internship
>> *today*, *May 13, 2025*, and n*oticed some task deadlines (e.g., May 10)
>> have passed.* I=E2=80=99m highly motivated to complete all tasks and con=
tribute
>> to the kernel. And will submit all of them in this email chain. I hope y=
ou
>> consider this.
>>
>> PFA: my first task- Build & boot kernel
>>
>> Thank you for your guidance. Looking forward to hearing from you.
>>
>> Best regards,
>> Shivam Sharma
>>
>

--0000000000002f9c72063517934f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For the 2nd task (Documentation task), Please Find Attache=
d .txt file also. It is the same .patch file, just different format.<div><b=
r></div><div>Regards</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 14 May 2025 at 17:4=
5, Shivam Sharma &lt;<a href=3D"mailto:10sharmashivam@gmail.com">10sharmash=
ivam@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr">Dear Shuah Khan,<br><br>PFA 2nd task-=C2=A0D=
ocumentation task<br><br>Regards</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 14 May 2025 at 16:45, Shivam Sharma=
 &lt;<a href=3D"mailto:10sharmashivam@gmail.com" target=3D"_blank">10sharma=
shivam@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">





<p>Dear Shuah Khan,<br><br>I applied for the Linux Kernel Bug Fixing Summer=
 2025 LFX Internship=C2=A0<b>today</b>,=C2=A0<b>May 13, 2025</b>, and n<b>o=
ticed some task deadlines (e.g., May 10) have passed.</b>=C2=A0I=E2=80=99m =
highly motivated to complete all tasks and contribute to the kernel. And wi=
ll submit all of them in this email chain. I hope you consider this.=C2=A0<=
br><br>PFA: my first task-=C2=A0Build &amp; boot kernel<br><br>Thank you fo=
r your guidance. Looking forward to hearing from you.=C2=A0</p><div><br>Bes=
t regards,<br>Shivam Sharma</div></div>
</blockquote></div>
</blockquote></div>

--0000000000002f9c72063517934f--
--0000000000002f9c750635179351
Content-Type: text/plain; charset="US-ASCII"; name="kernel-doc-fix.txt"
Content-Disposition: attachment; filename="kernel-doc-fix.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_manwrl180>
X-Attachment-Id: f_manwrl180

RnJvbSA4MWNmMmI3NDI0MGNhNDUzMGM2Y2YwMmYwNjNkOTJkMjFlNWUxNzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW0gU2hhcm1hIDwxMHNoYXJtYXNoaXZhbUBnbWFpbC5j
b20+CkRhdGU6IFdlZCwgMTQgTWF5IDIwMjUgMTI6MDc6NDQgKzAwMDAKU3ViamVjdDogW1BBVENI
XSBkb2NzOiBmaXgga2VybmVsLWRvYyB3YXJuaW5nIGZvcgogRENfSERDUF9MQ19FTkFCTEVfU1df
RkFMTEJBQ0sgZW51bQoKVGhlIGVudW0gRENfSERDUF9MQ19FTkFCTEVfU1dfRkFMTEJBQ0sgd2Fz
IG1pc3NpbmcgYSBjb2xvbiAnOicgaW4gaXRzIGtlcm5lbC1kb2MsCndoaWNoIGNhdXNlZCBkb2N1
bWVudGF0aW9uIGJ1aWxkIHdhcm5pbmdzLiBUaGlzIHBhdGNoIGFkZHMgdGhlIG1pc3NpbmcgY29s
b24uCgpTaWduZWQtb2ZmLWJ5OiBTaGl2YW0gU2hhcm1hIDwxMHNoYXJtYXNoaXZhbUBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCmluZGV4IDRjOTViODg1ZC4uYzhlY2NlZTli
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKQEAgLTM2Niw3ICsz
NjYsNyBAQCBlbnVtIERDX0RFQlVHX01BU0sgewogCURDX0hEQ1BfTENfRk9SQ0VfRldfRU5BQkxF
ID0gMHg4MDAwMCwKIAogCS8qKgotCSAqIEBEQ19IRENQX0xDX0VOQUJMRV9TV19GQUxMQkFDSyBJ
ZiBzZXQsIHVwb24gSERDUCBMb2NhbGl0eSBDaGVjayBGVworCSAqIEBEQ19IRENQX0xDX0VOQUJM
RV9TV19GQUxMQkFDSzogSWYgc2V0LCB1cG9uIEhEQ1AgTG9jYWxpdHkgQ2hlY2sgRlcKIAkgKiBw
YXRoIGZhaWx1cmUsIHJldHJ5IHVzaW5nIGxlZ2FjeSBTVyBwYXRoLgogCSAqLwogCURDX0hEQ1Bf
TENfRU5BQkxFX1NXX0ZBTExCQUNLID0gMHgxMDAwMDAsCi0tIAoyLjQ5LjAKCg==
--0000000000002f9c750635179351--
