Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C984BE453
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827601; cv=none; b=l0ymABuTc5t7mQnLMxbjKwx9UfgPvSTvkVTQp1tAot+gedVF7ulCIz+3g+qxi7PNutjfyXlUEjh7txfnXXkdt/2f7HeHHgjSy159ehzqbXCcr9Ua1DNQG38UnjMbqsyRSrMwUXU60a1q8Tl9TbngbDIhPPtemy7yWupWNXYME1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827601; c=relaxed/simple;
	bh=5yEKgPOGicpMxBFlJWtx7YufLwPyGaBoBvclQixlx9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amk6Gzjzispisckxr/kzoAmdxt0JWsfxIDdwX2TvulI2ruZFSH+Dr9u9/8BXfQA0PSSvABza7aalQAIwlwB6i+JhW97XB+BFh3ZK1+/NOWUuZbrVI9VSjdpFujVd0EtOiylGRFpgpzhnZvLScAsUGp7QSzsVMea5IOLRuDeOC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNtW/Tc5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNtW/Tc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96861F008A1
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827599;
	bh=/y391TGDcvyQwXbh4hH2fOqRNprRkLpGxVrH7rsjr/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QNtW/Tc58Fbs0yWzisqUK4W+9LSfQcmibGE8hW+JfbdywqK8aVAAmRTZcFsFg1cKP
	 z7oxb3Jb8Z8Mw5214KOkqVoQPUa/bGVbJKB+LtfMIuvSzn5l5sAy+6VOrR+sj7Y4qP
	 2YHeQM7iSXPYOgrM9gg1cjRq0149XwicFddZNrXPhXVSp5eMct9uECdNkd0W2OT882
	 sRUagWgiiwSbTV5ZU77/vB++RQ6xt3rZp+XnyfFgeOIGh/guaRBX9rZ9F6nKmS/rNN
	 V7fZREtRQ9fj7BC6B2ZEm+ZX3jlmJsFJbNpu6MvXipw49Ma2rO+muzyBsDPnlKN2a1
	 tJzoVxQn1lqxg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1472354e87.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 10:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgf7Di2bmjUR7mGMUijiX+gshqMTq8OzPQc8rb5MDxhtpEIOOI9bfIVh+EVqtwMWfSXSloaK8ldSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpaaVkacRDMJeU3NZGNe+B10qkGWfEH5Z8zQGqTsl6GdIEG/Wk
	f+tAGs5dZ745bnbmji+WJCVLfSfXgvsuoeqQAdS29QF5PPvftQgsYqYG/YYU+vdKmAHrXqKdE9X
	03fk93olC2k+I4k2kufoYQqBXWHMGe0c=
X-Received: by 2002:a05:6512:1284:b0:5bc:b728:324 with SMTP id
 2adb3069b0e04-5bcde6be018mr3241540e87.12.1791827598373; Mon, 12 Oct 2026
 10:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179095238036.1979087.7916496223328936920.acpi-device-id-docs-v2@gmail.com>
In-Reply-To: <179095238036.1979087.7916496223328936920.acpi-device-id-docs-v2@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 19:51:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0irqbrMDNikcFmTRyakWvcLjDxB5y1vOymwZnp4kM8jqg@mail.gmail.com>
X-Gm-Features: AclHuK9FQpA2UeIcQN6SBcLM8QgiLSCr43agXt6T5sZ9fbUoTPP4BGhwhasdvfs
Message-ID: <CAJZ5v0irqbrMDNikcFmTRyakWvcLjDxB5y1vOymwZnp4kM8jqg@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: device-id: document struct acpi_device_id
To: miguelgarciaroman8@gmail.com
Cc: rafael@kernel.org, u.kleine-koenig@baylibre.com, kmehltretter@gmail.com, 
	andriy.shevchenko@linux.intel.com, corbet@lwn.net, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 4:47=E2=80=AFPM Miguel Garcia via B4 Relay
<devnull+miguelgarciaroman8.gmail.com@kernel.org> wrote:
>
> From: Miguel Garcia <miguelgarciaroman8@gmail.com>
>
> struct acpi_device_id lacks kernel-doc, so extracting documentation from
> its header describes ACPI_DEVICE_CLASS() but not the matching table entry=
.
>
> Document the four members, ID and class-code matching, and the table
> terminator. This complements the documentation header-split work
> without changing its include directives.
>
> Link: https://lore.kernel.org/all/aqEWUBf1pewPP_K2@monoceros/
> Assisted-by: LLM
> Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
> ---
> Changes in v2:
> - Use ACPI_DEVICE_CLASS() in the commit message, as requested by Andy.
> - Move the drafting and validation notes below the commit message.
> - Describe the related header-split work without assuming its status.
> - No change to the source diff.
>
> v1: https://lore.kernel.org/r/20260913095111.2543502-1-miguelgarciaroman8=
@gmail.com/
>
> An LLM drafted this comment and changelog after being asked to address
> the missing documentation noted in the header-split discussion. The
> field descriptions were checked against the ACPI matching code. The
> extracted documentation passes kernel-doc and a focused Sphinx HTML
> build with warnings treated as errors; checkpatch reports no warnings.
>
>  include/linux/device-id/acpi.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/linux/device-id/acpi.h b/include/linux/device-id/acp=
i.h
> index 65800cefd..8c3b30ebf 100644
> --- a/include/linux/device-id/acpi.h
> +++ b/include/linux/device-id/acpi.h
> @@ -9,6 +9,16 @@ typedef unsigned long kernel_ulong_t;
>
>  #define ACPI_ID_LEN    16
>
> +/**
> + * struct acpi_device_id - ACPI device matching table entry
> + * @id: NUL-terminated hardware ID (_HID) or compatible ID (_CID) to mat=
ch.

This should be

+ * @id: NUL-terminated ACPI or PNP device ID (as defined by the ACPI
specification) to match.

> + * @driver_data: Data private to the driver.
> + * @cls: PCI-defined class, subclass and programming interface code (_CL=
S).
> + * @cls_msk: Mask selecting the class-code fields to match.
> + *
> + * Use @id for ID matching or ACPI_DEVICE_CLASS() for class-code matchin=
g.

I would say here

"Either @id is used for device ID matching, or @cls along with
@cls_mask is used for class-code matching via ACPI_DEVICE_CLASS()."

> + * Terminate the table with an entry whose @id is empty and @cls is zero=
.

s/is empty/represents an empty string/

> + */
>  struct acpi_device_id {
>         __u8 id[ACPI_ID_LEN];
>         kernel_ulong_t driver_data;
> --
