Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B76230264
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848040; cv=none; b=UuHj8jg+qCBm1gV1EonGbZTf3fUKcaR2+FaRmXNXfW6NxeGEgYbzXlOBKSdic/R74wxs4uRbtAHB3Rni+NxqdFgaVnCCpfFtQaww1P4Y1TNzdM7BT3hW7ZlY1w6spSzzAf1zQd0FAY+qzZuyYu9IBI9aXBf19EQz06ju2KpGJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848040; c=relaxed/simple;
	bh=rDckcXtAxCRs1jWV+jUesnF45T+CnmnVpB2u0iOadWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrmARc+4c1lgf/LyY811vzJXNSPTYxCvLIc3TZJz2TYLIGefsAPpfQAgdw/ocbbX0dKJ4aQvpauL+QKPISXYTrvci150FJs12beYdz97t7Wujibdu6Y+Cmq7mlSx9ZPuf1GdsgSrGMVqDP0pviIvZrrLUlLfj/I7ZGVXyQZRGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMEXNro+; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMEXNro+"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ed7a7ddc27so38844271cf.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 00:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762848038; x=1763452838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDckcXtAxCRs1jWV+jUesnF45T+CnmnVpB2u0iOadWc=;
        b=dMEXNro+SHGTY/+9Z/7uc1v48KYx21QMwKplGdMpfJnE75nZOkiVa7BPpGDoIUGu9h
         ybEKHEth3SL2IbekjtgU+rOUwldyFy8b1gQD1KrMvh0uKu2sy0EpxQuPmlpCvdemDnw6
         Fo9wibn6RR6vdd4osfOmannEoFin2tMt35E4s17M9sqhYPzTyjO7T626bqUJay3jENT2
         MFnjXESOoXW550pxUAn/ejwNl6JSdLnlRSDWHP1bL83J9BVBdhM/qFkxHL8V9dYjx5v8
         vN8ZQ8oIs7YxODm8F0YN04ZD/e7+lDLwrhnJ88FDHvGugcTm14i1ClDaJcgPjc8JfXce
         qRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848038; x=1763452838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDckcXtAxCRs1jWV+jUesnF45T+CnmnVpB2u0iOadWc=;
        b=BjddUZVgzCVqIenXNyVNzCbsnhkh/H38ZWnCIrjPu6A+vcwqd/wvyHLuVc5AYKy5wL
         WNqGcpAboRW/UOF5WrllL6YZXuYOtm4+8ldG8XlK/N03qYWinWOKdL6ElfVieC7UzDGT
         1rUprMEde8ctBNW23e7anlAtmjbk3CJ2ZHyrhQHZ5iJgKR68G+Fd6wg15BoVSHBibr43
         b/KeTVonOVjJ5E2skBsYY4JuQqPQlCqRzBjZuQmcI6Si6uM03X+Tpy2AEQamiTe3xvLF
         3STLEnQblGnKYuvCi4CbADUHCytwPD6qkKHZOqK5RvokcFOrcPVzJbhqTG+arn1clyGI
         3dWA==
X-Forwarded-Encrypted: i=1; AJvYcCWOwjUBQKpWNAejiUd1hngi3vRzuCjh8a01Pb4cxEbwOxfWG+VczjHKYkdP1uKHC5KbOLmE/OfYrm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mK0mh8UctS4UR9MNR2TCJTeK1eMkJOGGd7UfIHiXQCNGcRF0
	U1Of71kHlQF3ZtJLiQCzSO8IFQ4kDstxhPyBBkSTfEsUFdg6e4QsgshyqbllKKF/le7FpdE8j/a
	Wr+IyYw49gS2nUaoCSJuU52hC8i+jRUA=
X-Gm-Gg: ASbGncsdECfJwn3DnQqibrTvJe4JyREFSNNPa5JW4I8UaIYsD0vltZzXfjxpb0glPmF
	Ebj1TGzUhsXdmTmP+LZUWBQmB9VfCwE60KXXilG4+LrnlZWnYUoBiSL0ZdJbmn4LmpAw1lR5UE0
	Ss+Ek8b9HXJ9RNvElmcK4C6pFK0ymBIEPMdZlPPUS0PkQiSIYD6NJpEoPJgWQZdt4KE6hhBGfw9
	mB8zE6J21WzoMB/+jpQtmvwGhoP7w+kKdmZXpYiO3rqgWEkdT+0BTu3pzo=
X-Google-Smtp-Source: AGHT+IFVQuNm4jzoJ0sfN31dAeG2EzznRF+s6nZQWq2ePzdvY6tzRS6akqHmsN2TOSmWNU1I2EXt++5wc1vnYMks77o=
X-Received: by 2002:a05:622a:1487:b0:4ec:f39e:a614 with SMTP id
 d75a77b69052e-4eda4fe7d80mr139466921cf.74.1762848037835; Tue, 11 Nov 2025
 00:00:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hwttMyUn0qsEcSBbrQ1h+aSzNpHMhgAxEbqJZn4vf5hBw@mail.gmail.com>
 <aRKll6BXZdW2I_Wq@casper.infradead.org>
In-Reply-To: <aRKll6BXZdW2I_Wq@casper.infradead.org>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 11 Nov 2025 16:00:26 +0800
X-Gm-Features: AWmQ_bkZp1Ha95rOqs1HW3UzS3vKjZUDVxeK0wVkc4B4tdWTsyLi5q4Md1SVIsM
Message-ID: <CAJhGHyCArEwKNF3uug3ZW8eAJKw4EyJwt302W1O7PnvPY=k-7A@mail.gmail.com>
Subject: Re: [PATCH] workqueue: add workqueue.mayday_initial_timeout
To: ying chen <yc1082463@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, corbet@lwn.net, tj@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, laoar.shao@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Chen

Thanks for trying to improve.

On Tue, Nov 11, 2025 at 10:55=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Tue, Nov 11, 2025 at 10:52:44AM +0800, ying chen wrote:
> > If creating a new worker takes longer than MAYDAY_INITIAL_TIMEOUT,
> > the rescuer thread will be woken up to process works scheduled on
> > @pool, resulting in sequential execution of all works. This may lead
> > to a situation where one work blocks others. However, the initial
> > rescue timeout defaults to 10 milliseconds, which can easily be
> > triggered in heavy-load environments.


This is what it was intended for. A workqueue equipped with a rescuer
is considered a single-threaded workqueue, where deadlock can occur
when there are works depending on each other.

It is recommended that the user modify the works to eliminate any
dependencies or consider using multiple workqueues. Increasing the
timeout doesn=E2=80=99t solve the problem; it merely hides it.

Changing the workqueue implementation to support concurrency for
the rescuer would complicate the design unnecessarily. The use of a
rescuer is only for memory reclamation, where the works should be
simple, focusing on freeing memory rather than waiting each other.

Thanks
Lai

>
> Then we should tune it automatically, not blame the admin for not tuning
> this parameter.
