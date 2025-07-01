Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AA27381F
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374569; cv=none; b=NCRF/AsiC+7JIr534wK2JqDjrDeG92gTsqiq5CRSoTp3fc74LI0b/za22bgR6+TzIQYRydMnHIYyziJlL9wv5K2LqhFu9GS9ckK1Qs5qg25hrxcas+u36jjqbzHf7ONgq3AO+K3PKdRG8Rm/K63oAufj5JALZBXF/7dIDop237o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374569; c=relaxed/simple;
	bh=TKG5IymVnkXJex1Gwu3CospUcoxQz3nNTflPsWghNUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDDOuwUtT7a4cal8o9e61e12anZztGMnTru64DHFhOwrrqB9mz1T/gdiwg7IqRyNj1DSnmkPQZ8Aa/qo+HiyBpmnoMXT53/0TWOTqJhXXzf6jSzDmsHpNpHB2TxTJPyWINleV0Kw1J6xmGt3aCH5QVwLjlY2MCz653HQ1q9ZUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpTKZY0l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpTKZY0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751374566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBTTVjLLJBrVGUELHkLxjKRb9WdjU8gNsqCCuiEsmE4=;
	b=UpTKZY0lWq/di5n9flfildEPiDACfJxCz7AXgfORlUIra4Ni41EXN/jqltnP6aUWkXmOEl
	V+Skv/ulqxWiacWD06IZOWlfIYH7sgwM0qV/pNxaCeB+oznzxi9AMu9FD+5ixfcpJ7JjD9
	f3nud99PN3PNJeUWB5vhCeA2xGij0Lw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-OTcyj3JDNs2gTSuZU_SN7A-1; Tue, 01 Jul 2025 08:56:05 -0400
X-MC-Unique: OTcyj3JDNs2gTSuZU_SN7A-1
X-Mimecast-MFC-AGG-ID: OTcyj3JDNs2gTSuZU_SN7A_1751374564
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532514dee8so35868245e9.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 05:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374564; x=1751979364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBTTVjLLJBrVGUELHkLxjKRb9WdjU8gNsqCCuiEsmE4=;
        b=DNeGBigAYWQOMWzFsMs/UupWiNoYKKt5sbFioP20HY9I8OP2zu68vVNc4FnQLVTVHe
         DHSwS0EZbbM/0ssxCApL398bK6qrnzwbKZc/XtMEtRP/uxyJ05g24sA/h85V6FKbTIIn
         y1gosnq5u3NKUaTW2f+GTAJIV06rjnnrrOFVMBkQGtwaLVe9AUhKoOhcUnnV2/AOmJFD
         HYlER3ei0gdxVJXy1A1Heu/QajuN3oJaqqvVbKOxsdAIWOK6FsLv5odMxWFUwGebUfL0
         yLtDWaZRnraVaZvbXFO10HxGV1Ub4UY+1viz92/TaOePGSiPyfH7zpJTZVaVxVMoq+ZM
         SG9w==
X-Forwarded-Encrypted: i=1; AJvYcCUh7wm2Rkl8PqRVxpx1ThV+Hojle0AsQ5/6Fej0kU6fls6Ao4IZgtu7SbJU3iMHvh/sb1CNy5Wz6Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhOWjkj4iVbsydHCz0Gr1iOHcmeaWYeJlJGOjuwPftObxCWsB
	QQy4QW2h407y1Kb8kBqV0eZDWXKbfh1w+RnC4uXLlzewyU5Lf4btnBBSsQ5a9V4vrzTe3DKRMyT
	Mv3XHxew5gbCz3GUJLmdW5P7LjpQlmgP5vqDsycQjXDUtGZFYLV/hXFOdnuJiRQ==
X-Gm-Gg: ASbGncsi2+c+8dpzlijzH6SPrGyyhkpMLHeI8esyCCSm4G6GuIhY/a1sb1AJjyDDsEM
	bDt4TrFHZm2GycxbgNhhNmM5Ze8ZEW01IVRNpKY+D+o6EL5GsHXBv8AUANZBHar8H824GbsGIWq
	jFvPlKO9Csw8+lasAJZ4p4SAvRFuLm11Pg1TvU/IUqVm6fgNflxMM+NzZGUvH6ZH2SlnIRDls6I
	Np3/KYXGD2zstWet+EEqPSc3NjWGN62RnQ4/mV7fdsXzcX1wJnGW+LKACv914sBgSNnVJ2Kd6mD
	dn7V4F1I/OrqhoWqGvU+O367ryjTkKrPDe3lMwKx6TXxsDsFgOd2hNI6ketmPPSMfkLsVw==
X-Received: by 2002:a05:600c:4752:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-4538ee27811mr225406325e9.10.1751374563675;
        Tue, 01 Jul 2025 05:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaw4kk4Kktx3Hecxbs6t1i/0jp4a/LW9tAythw2vOj1c39nlQ1UxxFJwKx+MpgP7+zm22KQw==
X-Received: by 2002:a05:600c:4752:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-4538ee27811mr225405765e9.10.1751374563208;
        Tue, 01 Jul 2025 05:56:03 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595c6sm13522571f8f.66.2025.07.01.05.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:56:02 -0700 (PDT)
Message-ID: <f875faa2-718d-4244-bb86-2178fed55922@redhat.com>
Date: Tue, 1 Jul 2025 14:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v06 4/8] hinic3: Command Queue interfaces
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <helgaas@kernel.org>,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Meny Yossefi <meny.yossefi@huawei.com>,
 Gur Stavi <gur.stavi@huawei.com>, Lee Trager <lee@trager.us>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Suman Ghosh
 <sumang@marvell.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Joe Damato <jdamato@fastly.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1750937080.git.zhuyikai1@h-partners.com>
 <6c5406f1e4981a5c4eb3345199f480e37a5e7223.1750937080.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <6c5406f1e4981a5c4eb3345199f480e37a5e7223.1750937080.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 8:12 AM, Fan Gong wrote:
> +static void cmdq_sync_cmd_handler(struct hinic3_cmdq *cmdq,
> +				  struct cmdq_wqe *wqe, u16 ci)
> +{
> +	spin_lock(&cmdq->cmdq_lock);
> +	cmdq_update_cmd_status(cmdq, ci, wqe);
> +	if (cmdq->cmd_infos[ci].cmpt_code) {
> +		*cmdq->cmd_infos[ci].cmpt_code = CMDQ_DIRECT_SYNC_CMPT_CODE;
> +		cmdq->cmd_infos[ci].cmpt_code = NULL;
> +	}
> +
> +	/* Ensure that completion code has been updated before updating done */
> +	smp_rmb();

There is something off with the above barrier. It's not clear where is
the paired wmb() and the comment looks misleading as this barrier order
reads operation and not writes (as implied by 'updating').

+static int cmdq_sync_cmd_direct_resp(struct hinic3_cmdq *cmdq, u8 mod,
u8 cmd,
> +				     struct hinic3_cmd_buf *buf_in,
> +				     u64 *out_param)
> +{
> +	struct hinic3_cmdq_cmd_info *cmd_info, saved_cmd_info;
> +	int cmpt_code = CMDQ_SEND_CMPT_CODE;
> +	struct cmdq_wqe *curr_wqe, wqe = {};
> +	struct hinic3_wq *wq = &cmdq->wq;
> +	u16 curr_prod_idx, next_prod_idx;
> +	struct completion done;
> +	u64 curr_msg_id;
> +	int errcode;
> +	u8 wrapped;
> +	int err;
> +
> +	spin_lock_bh(&cmdq->cmdq_lock);
> +	curr_wqe = cmdq_get_wqe(wq, &curr_prod_idx);
> +	if (!curr_wqe) {
> +		spin_unlock_bh(&cmdq->cmdq_lock);
> +		return -EBUSY;
> +	}
> +
> +	wrapped = cmdq->wrapped;
> +	next_prod_idx = curr_prod_idx + CMDQ_WQE_NUM_WQEBBS;
> +	if (next_prod_idx >= wq->q_depth) {
> +		cmdq->wrapped ^= 1;
> +		next_prod_idx -= wq->q_depth;
> +	}
> +
> +	cmd_info = &cmdq->cmd_infos[curr_prod_idx];
> +	init_completion(&done);
> +	refcount_inc(&buf_in->ref_cnt);
> +	cmd_info->cmd_type = HINIC3_CMD_TYPE_DIRECT_RESP;
> +	cmd_info->done = &done;
> +	cmd_info->errcode = &errcode;
> +	cmd_info->direct_resp = out_param;
> +	cmd_info->cmpt_code = &cmpt_code;
> +	cmd_info->buf_in = buf_in;
> +	saved_cmd_info = *cmd_info;
> +	cmdq_set_lcmd_wqe(&wqe, CMDQ_CMD_DIRECT_RESP, buf_in, NULL,
> +			  wrapped, mod, cmd, curr_prod_idx);
> +
> +	cmdq_wqe_fill(curr_wqe, &wqe);
> +	(cmd_info->cmdq_msg_id)++;
> +	curr_msg_id = cmd_info->cmdq_msg_id;
> +	cmdq_set_db(cmdq, HINIC3_CMDQ_SYNC, next_prod_idx);
> +	spin_unlock_bh(&cmdq->cmdq_lock);
> +
> +	err = wait_cmdq_sync_cmd_completion(cmdq, cmd_info, &saved_cmd_info,
> +					    curr_msg_id, curr_prod_idx,
> +					    curr_wqe, CMDQ_CMD_TIMEOUT);
> +	if (err) {
> +		dev_err(cmdq->hwdev->dev,
> +			"Cmdq sync command timeout, mod: %u, cmd: %u, prod idx: 0x%x\n",
> +			mod, cmd, curr_prod_idx);
> +		err = -ETIMEDOUT;
> +	}
> +
> +	if (cmpt_code == CMDQ_FORCE_STOP_CMPT_CODE) {
> +		dev_dbg(cmdq->hwdev->dev,
> +			"Force stop cmdq cmd, mod: %u, cmd: %u\n", mod, cmd);
> +		err = -EAGAIN;
> +	}
> +
> +	smp_rmb(); /* read error code after completion */

Isn't the errcode updated under the spinlock protection? Why is this
barrier neeed?

/P

