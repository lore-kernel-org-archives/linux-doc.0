Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2EC49B1E5
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185908; cv=pass; b=npAdg32JBMSklWBfiVCti7G4aFwrXNnTyB/qXgz9xQK/JJmtHB5W/21UBrG4YMJHnvbQjLzRTjLODQRwhoOwedOEzDTihUxx1XE4hSY1iqpspgrumUquAJ+6UacSrbSTdsGdUK8mTphA6fvQXU5MDOLl+zRFex+PsRhGf64AY+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185908; c=relaxed/simple;
	bh=5ebukEa9X8TLK1zNOHZXcjEycVHzAZwRNrrqasYyvKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ26JhdotxsKHrSLs7GIEz6GqhfvDIOmcIDS5Uy98HEadKw4pf+ghE6V9TydM0w6DdvTx8VEopDwCAxmJof6roN+X+tR/mb8lBLEzzvL/Xnrsk5ZEipWd2nAXo/w8Io6h79gIpOjXpmby6gCvMmJ40KKeCAEttmf+Dz7NxuU0Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLsbyPBN; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLsbyPBN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so6104958a91.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788185907; cv=none;
        d=google.com; s=arc-20260327;
        b=iCX9YuymXqijhnJb/OVfVLKyLWk8EeL8eFB3QgJ5IsnMEJiiKna2aFeX3ynA7j9BG/
         qev0YQwxDUs/YSTRA4eVpcDImZhJzFQ8Av0tA81l5sfMNuJUH46eLBdleO8m2ktbZUKZ
         270yvtEm7MG0/MTzzP33icFp2nU+EIGYEYkbvF9TSgceGSTyEWY3LAxFJUKOchazFpXl
         GhIL5QA5SGkIgxJIjVg2su6Ye0+PliTQO8Te1DRcl93w5QqGTN50Y1hI0KzH+B8zD0PE
         +szHrDg6sPLIvdPW0yqv5GiYrjzj9SSDlHet8mvkB5im8eARfj5UrJaVg7TcsO0Dmr9x
         mAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        fh=K8DfkS+T62sIdLXPwVW2NYTgjwIxe5EVuGAKzzDa2/0=;
        b=RedYqmNaIZ/Xfv5j5LbG7CBvTM/D6tEqPg2c4sk4ApQ+kxoclmnYWZj8BStvHv1DBj
         zT6ak+cEuPEDGHRzHH7c3k3QtyUOLs+0NDU2M/elnhlXArKpH1/Lz9A6EXmiyIEvR2tv
         ExHVmTlHtVX8BHrsdMrk54o/3lP1HPVEbGWrXTv/Lqbkk7WNZgP6+71hgh9Y4I3fup/e
         pmHLJacJ2m+Pf153qcDMpzGYgEtFePIVEMEXpbay8rUy3LqBKlx5d/eGc9Wh6INbCGm3
         C6EeBBsUm3aHPE0Oi9dxC7gLHSbwRTGLjlbphePvcmdvk/3JofUmF9zV844joLTsbdDE
         r3yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185907; x=1788790707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=aLsbyPBNeRqQU+KBefDS/iiNA3A19Xk+Xh8XWWtQvI/pc9k6E1UCvlvtakSXMb6xDu
         /QemWCiuVO7Ah5lhhz5W1nafLXNxph3PLxyiQ625k8TpZbnhlWmEMMBBOoeNXcWj4HP6
         /HOp2J60b00LgeB829rcXk0xTB4jnmq9pUPS0o5GqWwGrTyXKWIMw+a9DD0QkJDYZUEW
         CSQRJNDyx4FlTyCw9fyshHbiwKjDvM3NS+DoyRz1UPV1WISs2HLyAJ2W62KASgBTbvjZ
         I03aPYozG7IGRoY42zetGY3T7m2zAe1jNfSir6RHj12Jd1O/XE+mjMEQBydrk99ioBLe
         HMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185907; x=1788790707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=iJPxSYVbv1uECVP00ZbF/pvY6k6j9J+0DSSGi9+hi6w0nwKI39Su9KndnrkDreWze6
         dqr1oabVkxQcy7oi3uQu1XQ6rKRLX2LixwgBPj1OujJzY3RPIuf5FhBER/Qy4HZfASbr
         +7C2bbcY6FzqCaqrTJLGFhVbKotXZwsHzJ0PjW7nYxR/FvGvfyWbbW1NaTB7QKbj97u9
         VtrZabbDabkIOwvqsWj4QMihq40arJLQhnaWmk3NHsM4etuFuaHR496ZTOAUGB9oHhwj
         ULK7CzBH29fHPO5+Dp1Msk34LLeD1EdAPXOVIF1/zhs7to/QuIqKTVjT2TD7JPhVAJtQ
         eXjA==
X-Forwarded-Encrypted: i=1; AHgh+RrIAEa5wqcqovL9IL++LNjFNIxs2oj0ZrNGE13eTGtxX7BjsDQM8+UvngkrbTtAHSmNvvb/yQLFnmE=@vger.kernel.org
X-Gm-Message-State: AFuF++nuvEvSvciD49op3fPKU/B2tBmMcO1hB2rOHRvxtc7aMb4ZpbPQ
	9jGMHwqe0NdxF886UrSgo/s6E7gBoBhzB88csooYVBNFpL0ZF5E0k+X+l1TZyav1PfqcPm02Ies
	MbCxw0yZU6LpaZTmKZIPMj2T/oGRD1YA=
X-Gm-Gg: AR+sD12vuiMGJgl/D6GYM4qmkLMTNNExXw7/wd9/nlBtfxIDWu3k61WpjXEztjCVTji
	MgjDZDwMpoKjqdk3PVyAceUg7led2vvBu0V3tczR1IEAvp7Pt5xo8Ej9N9w8f7D9JqlxE7eZtWf
	OV1aCptxq/B0BCPLJaMdz0aJOmjqZTTFuu6UIuc0Q2w18XpwqO9U0oYlQ06XlwNeMyHhInMX/RO
	owiPwrT+9lKbAEPHnHz4ynd47eUisTB7lRnm7wDntfH6negaEu7a2YVjXeQMKhBwzNbYMl1oNhj
	UTGum7c8BkcyWgOdDDAvPzn/P3b5zixCTxKgFGH8A8y/Fr5Jt9fIv1fVvkea559CDLXNIH83wcF
	QD7yv+X96WA==
X-Received: by 2002:a05:6a21:339c:b0:3c3:64cb:9b99 with SMTP id
 adf61e73a8af0-3d265a3df5amr37173569637.6.1788185906618; Mon, 31 Aug 2026
 07:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
In-Reply-To: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 16:18:14 +0200
X-Gm-Features: AcwNN1Xm-dHdx5qoEWmx-mK7azvrCKK8tNYI9QQLi_Q61e2CGu-085AeqI9F8U8
Message-ID: <CAB95QASxkb0sFxBSSY5PA3QJQEs04rBaKke7Oh9fGo1-asyE4A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, 30 Aug 2026 at 15:03, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:

> +static const struct ec_board_info board_info_strix_x670e_a_gaming_wifi = {
> +       .sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +               SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
> +       .mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +       .family = family_amd_600_series,
> +};

The board_info_strix_x670e_a_gaming_wifi struct does not seem to
differ from board_info_strix_x670e_e_gaming_wifi just below. Please
reference the existing one in the DMI_EXACT_MATCH_ASUS_BOARD_NAME().

Thank you,
Eugene
