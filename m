Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FD37F8C7
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889374; cv=pass; b=d+l1dDi9vSJHkITeVeMMp4qTdm4vgGSTJ3joeYvxMsFeq+8Yqsj2wI/+C/1iJb/BOleDTlSSIoQu+habKxGBNNepJaW95Ajjs08hLAQ+nR/I/7xjLEM0LT6md70OvH49I37At5jqZaKVjNTBqQnZN8NvfuffVMTcUXVr1KUUc9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889374; c=relaxed/simple;
	bh=J6zBSnuv2VUk6bsTnE+sg32kVJnVvTzg2RryFVDgAJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyBQMEkynLMoA43TW8HdC/WapanLGGNf08jEZdQtIise0l7NiQROfo8exD+4AJWL0cWhAgsp+MRzZT4JD0ol+WF8OF4KY1U+BLvdxBpuADuY7YdYQDNZ4umSbDMiuN1PyU5FeLYKkNt4IyqInBmGf9PNzJ1gAet6rFHrxnpFAvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nevCftR9; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nevCftR9"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so43609861fa.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 15:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771889371; cv=none;
        d=google.com; s=arc-20240605;
        b=J1kd8BYuEPwOJgA4VGGwwxCeIQIk6PaX1FNEg2OLHeVg/h1bGCGjokzCM61VLnq4iX
         xNfW75lNfNt2Ne4bOjE+GRWJOttl7RNahbGKJfQqPE2byqe6y0fI8oLJOxnfiIl+Tlgx
         YMPV3kQiFNGFXzNgzJEXsij82tUjmNg/ArK8r2ouXlyx8hYxEdPuQ8pOPvFJcW+IhOkX
         BJ3NFfTxdgVzQBSyuetJnBqIZJpMERb5rveS59QvRVUOh0zV4cTtNSOm9u3VKbK5Idnr
         ZI2+4pKtivT+Me+aR4r7448W+aGN5Ljt02YfXXJEkJoVfAa0xjv4DdEBgj/pSk9Qg3yE
         hW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        fh=viESndCN1lbMWHUmh2kTKJRQ+gJyBVtEg/+Mn43kA6M=;
        b=iG6S8+etNUvZ88c5rWO/l5GcabpPZanw8mP6jUm/ZKh0Jp3/mm+PYqpjd6gq1SOyro
         cbNvkbCPKTXl8wgvUZjGswIP3+ZAWG547+6vbgdnJnZ6aUl3b8YRzTMovZtMOPQ6IwXG
         2Zmd1DgiDvyHdliO3PggaNybwaPoJYb+oIDPzHOsrmkKOf+MXlzt3k2uvhTpGMBv9ool
         +SWve0fKY2/uwc7ovHncdU9hifkZJAl1l5+eyahZf9NYQUitu7qAsr/2kr5Eqgjddgbj
         CllADMlzeLk8jlLaf1D7ulOjF6EZE/DgExHnz8BRVlcXkxgo9zlWQ4nTAh9d2wPAQS+H
         sIDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771889371; x=1772494171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        b=nevCftR9AcRWGqYXWI1CDNO1KT1FavHDqplGfOdrQb0TohoQ+k1wd3vOxTBAvAlyJC
         tctF1YKqAQZzPABDHpC3Wq2cDvUOMrpa0ojmKtAFDX+9sUWrBgNFOs66mYFmvxRB/+sj
         2TMzAFFNsVscY+aHVp8lnOA1tSBqSUN0BJAPG3YoLoK2f1BQhmGEZrD7fYGc1qF/1h8o
         GwwTzzsIb3iBosONx0fA5jD+gFh6e/pQKAHFzKcFzXw5zEe/VrYaElIWJ8s6C1lgtVQb
         F7ruXjWis8DvjzYLlwV0vshL87NkxsGEm5Wt3cZUBYUhjFSQivzlD+q1B2aGCqWO9FZh
         JgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889371; x=1772494171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        b=sCa5v8fMtr4TC1vCsygSVpKXM03b8E21aanzmT2qApJSSc9xkp3md+qkSmt34uVHkn
         q6VlbOLcLKhEKELr/3pRadZeRm7gm2S8vi9723ExuBy0asbb4S3tC/WZY1k3jiwXtP7Z
         l7Ly+jSUtuL6NrUqtndxRcw0T1/hdC43y6Y0mku7HsyCdaBLXCY1KTeq4unGKRkGOAxE
         yBua1uuNyTkt4AIJ7Xv31FihpTGZrCnjju5Kml3imoZX/WyYEqhxWHRxcDTnGOMd31lZ
         ZysCQ0iagjCfHwk7b3CzSQ9sI27LsycLhQA8+i3JABGAOEbvSGPSYny+YvSLXV6i96wT
         d2nw==
X-Forwarded-Encrypted: i=1; AJvYcCW4MG6NqfGh2SP5Z1zojuCeuA6tTNSfKAN40CDwZvI1D4+2DzHhfc+kMV3kXgAKEQv8rd65thNMOOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH6qPawNOSewJmnAq3dgOD2gNdDumgS+FthKuyShWCX7WEgqdg
	YE3C7yDGynt84zcDwmnNn8y3PfQuPSTPprjvJSJYov2qukV5whOpPv0Bvz241c6uVrLGJHarndu
	tUiIlw+9hOAAW+S7YiKXXK0/Qdm8TQJM=
X-Gm-Gg: ATEYQzw484N6ue7SvOZIHImWsIyeg1xC1lXJpme1k22+aITZd1Q4Io5ZSfsgyAHqUKx
	vydPI80e9Hi1Dh/Qb2z2Q1x6MVOJnltRx9tUrtHSEiLVLX8nrYDMU5DE5ispVVlPDaSVOfqVXsi
	nZcq/fYOnWhUsKFyhhegMh3mrrv8TbFabA4SwaYLP+gvhw6LB0fMl+d8b44luwz/Oo0dLTMUSpP
	LZfPO4ScyApIsonnTs0RoAA/B3Dil+baOtYeZV1EsfBYIVqysCTdd8/Pv3y1Oi9pQ5sakqSvowx
	1mDBBF2z+RhLvMkcBg==
X-Received: by 2002:a05:651c:31cb:b0:383:2537:f121 with SMTP id
 38308e7fff4ca-389a5dae7a4mr30229781fa.26.1771889370676; Mon, 23 Feb 2026
 15:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com>
In-Reply-To: <20260209063355.491189-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 24 Feb 2026 08:28:51 +0900
X-Gm-Features: AaiRm52DBKb5bl7l5Bo_mvwDqKR1GnB0ZMS9OrdzJgEL0ePOj09NuELgOXAuIX4
Message-ID: <CABxCQKvNO78SeVp9pAnBOSAF=x0eFn03F33ftW-x-rZCG0-84Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] TrackPoint doubletap enablement and user control
To: mpearson-lenovo@squebb.ca, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	hansg@kernel.org, corbet@lwn.net, derekjohn.clark@gmail.com, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this series.

This is v7 addressing all previous review comments.
Please let me know if any further changes are needed.

Thanks,
Vishnu


On Mon, Feb 9, 2026 at 3:34=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.com> =
wrote:
>
> This patch series adds support for TrackPoint doubletap with a clear and
> simple separation of responsibilities between drivers:
>
> 1. Firmware enablement (trackpoint.c):
>    Automatically enables doubletap on capable hardware during device
>    detection.
>
> 2. User control (thinkpad_acpi.c):
>    Provides a sysfs interface to enable or disable delivery of doubletap
>    events to userspace.
>
> The approach follows the KISS principle:
> - The TrackPoint driver enables hardware functionality by default.
> - The thinkpad_acpi driver controls whether ACPI doubletap events are
>   delivered, using existing hotkey filtering infrastructure.
> - No cross-driver APIs or dual filtering paths are introduced.
>
> Changes in v7:
> - Removed unwanted comments and logs
>
> Changes in v6:
> - Documentation: fix formatting of the doubletap_enable sysfs attribute
>   description (separate "Values" list)
>
> Changes in v5:
> - Rename sysfs attribute from doubletap_filter to doubletap_enable to
>   reflect actual behavior.
> - Fix inverted logic so events are delivered only when doubletap is
>   enabled.
> - Suppress ACPI hotkey delivery instead of injecting or filtering input
>   events.
> - Register the sysfs attribute via hotkey_attributes[] instead of
>   device_create_file().
> - Drop unnecessary helper wrappers and debug logging.
> - Update Documentation to reflect the new naming and semantics.
>
> Changes in v4:
> - Complete redesign based on reviewer feedback.
> - trackpoint.c: Simplified to only enable doubletap by default.
> - trackpoint.c: Removed all sysfs attributes and global variables.
> - trackpoint.c: Uses firmware ID detection with deny list.
> - thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
> - thinkpad_acpi.c: No cross-driver dependencies.
> - Documentation: Updated to reflect simplified sysfs approach.
>
> Changes in v3:
> - No changes.
>
> Changes in v2:
> - Improved commit messages.
> - Removed unnecessary comments and debug messages.
> - Switched to strstarts() usage.
> - Simplified firmware capability detection logic.
>
> This version addresses the remaining review feedback by correcting the
> naming and logic inversion, aligning sysfs semantics with behavior, and
> fully integrating with existing thinkpad_acpi hotkey handling.
>
> Vishnu Sankar (3):
>   input: trackpoint - Enable doubletap by default on capable devices
>   platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
>     double-tap
>   Documentation: thinkpad-acpi - Document doubletap_enable attribute
>
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++
>  drivers/input/mouse/trackpoint.c              | 45 +++++++++++++++++++
>  drivers/input/mouse/trackpoint.h              |  5 +++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
>  4 files changed, 106 insertions(+), 7 deletions(-)
>
> --
> 2.51.0
>


--

Regards,

      Vishnu Sankar
