Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459B1FBEA2
	for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144589; cv=none; b=U8uMPSpOISaH+S+sP4pjZK2bq9JzpwguMqus7PDOlEo9LMYTwKJzYZ4xa2szUU/41yZm8mZGoxkzrj95hoeX4pG06VloaydGchJkF0orYJR4FHMYhsCOJABO5H/FlHywOFQWKwOyyrdkLmk7YrbgW2d1alTe1rumkX67M8K0S2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144589; c=relaxed/simple;
	bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RB7hhU6iiTwVjx45mzNrS9h+rj+AZteL6pQuokJimFVnP7yJG3pyxyH6VnJyDMhcPWQQMmEDIv1c7dMb8TSqJdP7iYJ3DS5LoXmcFVGCEfRaCLMT8sdnGIwWKI1eZl6HoP5696o1tjTJQ5/gcWkQk6f8yoHui4pKUB+iEaBunOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2K9Qnog; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2K9Qnog"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a77ffcb795so8070211cf.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752144587; x=1752749387; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
        b=Z2K9QnogARTMb9Np4MniBPB61NFHx2G08LJLBXxJLmm5A5KAMxuifVTPBFF6EFkjj2
         FjdXoF5dPHGXio3HDNaKMe6uShlXHYyfhtZfQVdMeUgyRXzdyNg+ssvhSUyNnIurr43Q
         9y3s2CSOsxvfSk0sVj4Z7nxtLoDQTNJgLVNqwB7sXvZiE3vMG2yA3DW+F4c089U6z38W
         IfgEL6b5c6L9ogbQTvHvJBxy/ktNeS1YSnUy/Yj/wkr5VFhOUrWwV+kObqOs+4t+79Pk
         he73f7ZlAKmp4mh9T64GMBNqRnGl7XWCZfIYOTAfuwOWWmH1bpUdWd90xSUQlQCLScnU
         OzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144587; x=1752749387;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ERYadl4idWZ6bP47UPPD8JzYK00w75uLtXXgxW78Zw=;
        b=D2T5sBwxjkxSKBe62VoKJY5eJ6z8xS2NG8tJw+odKPvPeuCLe6gsSBGqJEh6GNkDKY
         B11fDJrbu6PDT4gjT47yZ5zwoZ2shcrLeUcvaE7R5QO/biDkTENHp8MpDlV1hBbcYh+c
         IoncarJw4BaMbbMzV7aYHNofHdJQHRlGWgS1TKUzZNnwVjjUPNqFDeYmPIpba9Es9S2Z
         taWqFSGtef4QGYEiikOP95v3vZi08AQuy5sj86I+BB+YBMMGsJQagCIbs+3gkVKu+QJ9
         Cfp7D+vJ4jOgkXiHSo7OGtPRMeJ0ArCqflbrJFAUZ5w0u1y+a9y9tNMY/7F6rRGdimJc
         76nw==
X-Gm-Message-State: AOJu0Yzxb6nLqI2zEcPSfaIflXlPpl6qR47nvD9wbuS8V6OLV93MYdD6
	7ODPXQg7jzlqSQ1+VXVB65+tyFN59BiUBGQfXwmGxNEzaN/S3phL7lySstY3yZbHxD7WmKvMsQg
	rkkHdXRX+azvOTThtjuu6LPPrRAAgFieMMMCYimU=
X-Gm-Gg: ASbGnct1pag3NcJVdQNM4yBRZFE5U35RR1JpmgKB7KVN2n9LLJ8ogo/byt54YxSzuZQ
	UTkLoLzLnyKqwg8Ib/QbMp3dcZ/nSOHbEXtW+vlIL9JHmDsthEjq+OS7psbluwRbc4af2QW7PpS
	spDIXyRVj0OKkaz2FnhRvurQ0sY6nJUYRXsAKYTY0szSGu
X-Google-Smtp-Source: AGHT+IHWw0CZKqRk64V415MOqgLOIKESkwVjGL0N10xSRI6Mm0wnCDnJjVi17GkUAIjRjLNneu639e1Y2aeoCfW7ur4=
X-Received: by 2002:ac8:5a8e:0:b0:4a9:ab9b:6603 with SMTP id
 d75a77b69052e-4a9ded45e9dmr85023741cf.38.1752144586839; Thu, 10 Jul 2025
 03:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Samiksha Palav <samiksha.palav27@gmail.com>
Date: Thu, 10 Jul 2025 16:19:35 +0530
X-Gm-Features: Ac12FXw8s_b1xMA6WB1ON0Gyw9gRFthMQFXOw1PORjMtbwC1qw_8VcJ3gljb6TQ
Message-ID: <CALq_ZGG87NMgwpjoEq9UmhUu3iSEEr-RQoC8HhJKrByd_6qxBw@mail.gmail.com>
Subject: Introduction
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I=E2=80=99m Samiksha (a.k.a. Shdwcodr), an undergrad BCA student from India
with a relentless drive to get deep into the Linux kernel. I've
recently begun my journey contributing to the kernel, focusing on
staging drivers, learning the kernel development workflow, and
understanding the culture of patch submission and review.

Over the past few days, I=E2=80=99ve:
- Set up a local kernel build and testing workflow.
- Sent out my first real patch (not a dummy), with more lined up.
- Subscribed to key mailing lists and joined IRC channels to stay in the lo=
op.
- Started tracking patch feedback and diving into
`scripts/checkpatch.pl`, git send-email, and the entire mailing
list-based workflow.

My short-term goal is to get multiple patches accepted into staging by
early 2025, and long-term I=E2=80=99m aiming for the **LFX Kernel Mentorshi=
p
Program in 2026**.

I=E2=80=99ll be lurking, learning, and asking questions when stuck. Thanks =
in
advance to everyone who shares knowledge and guidance =E2=80=94 it means a =
lot
to newcomers like me.

Looking forward to learning from you all and giving back as I grow.

Cheers,
Samiksha (Shdwcodr)
