Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9338C7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Apr 2019 19:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfDITWq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Apr 2019 15:22:46 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44812 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfDITWp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Apr 2019 15:22:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id w5so21193877qtb.11
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2019 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ZgRk4oXW6/CmGrrvcpCr56kCO+VlPUKaYiIkmt4dYI=;
        b=UunMGqD23SDCKBC4ofCQcGG+oAyMCBH/rFe3rB2OQIzaRWES/coHlnxMd0mmdRo9yo
         sAJt4Smkr0OlfyhjEZUVPZA2yCSXfr1XO7F1SQ36E9uG3WtQ0ZqYTF5QDWeaf6xD+fvU
         33c9S/ghHz7t+BcHuSC5GKu7MPyA29LwF4Myz1cpR7V/NeKIOrTae3CVc7vvEeIcmdFg
         UvevtE9+LWzZd7T+9pWulPR4gYMRLDYaVBcfU5Qe6cCeRhyVLVp+VRK8gb9b7CTJQTMN
         WwsRkOgLnmwEuP28Ft9nH7xL0a3FvPbRMDkRsQLNkVHQPn8f/v/6VIR/faaKJ4OgW6+I
         +nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ZgRk4oXW6/CmGrrvcpCr56kCO+VlPUKaYiIkmt4dYI=;
        b=Jy08u79VnXRqrtG5mZUETiY3JwJYHHemCxc039WMZbY37C5CobiX29NkFwtO36z0Oy
         8nocZGdv00Dvt/BV89ic3U2hLDjJ1qAcpcpUU7FZP44MlOt4LF0FQbOhFCEzdTczFQPv
         4YUKlgjKdn2h1hgs9I8+W4iLsdkNNF7JYAKWJqaIRNuZITZnIkNyonGEieQWc03tKmVD
         vwz4AmmYPfvKXwAe4t3f6KlaVowSsykLaeP1T5+I/bsKoMXRfvok2ICT+2YvpBovszaY
         JO0ELEIF53h0fMYV74OTR/Ox0igb4JhZUonoWxzyd/0htbmtVdBOYH5x9Cfrl8ySQ0tM
         nsKw==
X-Gm-Message-State: APjAAAUmaasnCjIADlQh/INgenMoAvI8isKu1vRNGCfN0rcKiGVKdPPR
        H7c7iZWIgNAANESMT9TRG52wxA==
X-Google-Smtp-Source: APXvYqz5/E+ggDr8UTrQQBRjKFX1se7UdMOl+20fXzJz6G7FwRhWwfZlv9WogR0CXzBjTW0jzzv7hg==
X-Received: by 2002:ac8:2a2e:: with SMTP id k43mr32595153qtk.353.1554837764746;
        Tue, 09 Apr 2019 12:22:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.49.251])
        by smtp.gmail.com with ESMTPSA id v39sm21587449qtj.20.2019.04.09.12.22.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 12:22:41 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hDwKO-0003Sb-Sf; Tue, 09 Apr 2019 16:22:40 -0300
Date:   Tue, 9 Apr 2019 16:22:40 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Sasha Levin <sashal@kernel.org>
Cc:     peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com,
        mark.rutland@arm.com, corbet@lwn.net, robh+dt@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com
Subject: Re: [PATCH v2 2/3] ftpm: firmware TPM running in TEE
Message-ID: <20190409192240.GA12869@ziepe.ca>
References: <20190409184958.7476-1-sashal@kernel.org>
 <20190409184958.7476-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409184958.7476-3-sashal@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 09, 2019 at 02:49:57PM -0400, Sasha Levin wrote:

> +/*
> + * Undo what has been done in ftpm_tee_probe
> + */
> +static void ftpm_tee_deinit(struct ftpm_tee_private *pvt_data)
> +{
> +	/* Release the chip */
> +	tpm_chip_unregister(pvt_data->chip);
> +
> +	/* frees chip */
> +	if (pvt_data->chip)
> +		put_device(&pvt_data->chip->dev);
> +
> +	if (pvt_data->ctx) {
> +		/* Free the shared memory pool */
> +		tee_shm_free(pvt_data->shm);
> +
> +		/* close the existing session with fTPM TA*/
> +		tee_client_close_session(pvt_data->ctx, pvt_data->session);
> +
> +		/* close the context with TEE driver */
> +		tee_client_close_context(pvt_data->ctx);
> +	}

None of these if's are necessary, remove is only called if probe
succeeds. Would also make more sense to put this code into remove
instead of having it call one function..

> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> new file mode 100644
> index 000000000000..c1dd416d27c9
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation
> + */
> +
> +#ifndef __TPM_FTPM_TEE_H__
> +#define __TPM_FTPM_TEE_H__
> +
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +#include <linux/tpm.h>
> +
> +/* The TAFs ID implemented in this TA */
> +#define FTPM_OPTEE_TA_SUBMIT_COMMAND  (0)
> +#define FTPM_OPTEE_TA_EMULATE_PPI     (1)
> +
> +/* max. buffer size supported by fTPM  */
> +#define  MAX_COMMAND_SIZE       4096
> +#define  MAX_RESPONSE_SIZE      4096
> +
> +/**
> + * struct ftpm_tee_private - fTPM's private data
> + * @chip:     struct tpm_chip instance registered with tpm framework.
> + * @state:    internal state
> + * @session:  fTPM TA session identifier.
> + * @resp_len: cached response buffer length.
> + * @resp_buf: cached response buffer.
> + * @ctx:      TEE context handler.
> + * @shm:      Memory pool shared with fTPM TA in TEE.
> + */
> +struct ftpm_tee_private {
> +	struct tpm_chip *chip;
> +	u32 session;
> +	size_t resp_len;
> +	u8 resp_buf[MAX_RESPONSE_SIZE];
> +	struct tee_context *ctx;
> +	struct tee_shm *shm;
> +};
> +
> +/*
> + * Note: ftpm_tee_tpm_op_recv and ftpm_tee_tpm_op_send are called from the
> + * same routine tpm_try_transmit in tpm-interface.c. These calls are protected
> + * by chip->tpm_mutex => There is no need for protecting any data shared
> + * between these routines ex: struct ftpm_tee_private
> + */
> +
> +/* TA_FTPM_UUID: BC50D971-D4C9-42C4-82CB-343FB7F37896 */
> +static const uuid_t ftpm_ta_uuid =
> +	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
> +		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);

Don't put static variables in header files

Jason
