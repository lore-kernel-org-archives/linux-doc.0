Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3454127B5C
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712249847; cv=none; b=h8WlPI2JblNWmTLHAfMny9dDCPWWN8wRSkqoj2xVFDJU4enM6BwjCasixLp1GKFHClHPmdi3RbZ/hzhg9kY3pVTfpkpfWtZS7kIVXq0wZvqT5t7tAIJI03dmi1SdwzaFal/IlgWcm2YhSjETLJa19WIHciipw7C4GtTdOZaB7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712249847; c=relaxed/simple;
	bh=R+9sLKX/nC315A44AvcpxcbARQnYY3J+yoFn7VC1xFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOORj3QKCoWZWomRTjlJWsVOKN25v6tBVXI3rpn/9BRxgxvTCZCJIoUQaIKFSaCkrMCa1FO+tJv1MVF1KqKgOHq8xwPbMUjfkFQ/VtaeEgFTce+OhGO9CK//GRyxHiddQERF89Xa6R85zjb0GRzgHetVwG+J/tnj6bbri/H3ODQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=xzYCRirr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="xzYCRirr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso896378a12.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1712249845; x=1712854645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KS1cKngrmdXQc+cpy3xRzjISKJ7Nt5I+OzXFPLplu34=;
        b=xzYCRirrbqlExHb84hWiJ1usl8cxY+1nJj+wnkla9xzmMsKGsS9EM2yefrsl/WjLzT
         ZGX06NNjxaXQ7XPOFZqVPYSngOVwKKctyiboUVSc12SsvYsDyW3y7t6jea5PdZQ2IbSJ
         g0OS5KN7EmBEXIlrA0X/B2ZE1Gpm9vNwpjGukDzX9u0nH/guuVK5IkxI5yFbHtsBMFPx
         Z5nxrvRoMWBh7qkUwzRZBxf5iaiU3FFR6jo28ifYu2CjFFtr8ok928BghHnQZSUOnSw2
         pUwcJFIuplE1xehxaC4VHdGRsAG44oOWboB2CanxpsKgtFHAvgAAgWNxdD82hFTxVKV9
         7jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712249845; x=1712854645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KS1cKngrmdXQc+cpy3xRzjISKJ7Nt5I+OzXFPLplu34=;
        b=hjGF3zgjkHsToeCmCBYPynXfrezXNut7cJDJx92UOP5dNnEyLOjbhUO3u6q6wWkmyl
         AzY5EPT1sTbf+AoQRrYcUdrQuKq80CKBIoMpmJcUHDeEIcEdmhzMkuCo9TpiLQ8ChZp6
         6fnljO1jQREfK7GF6PpIqL1gY3sR2sK2d9rzOWS9D+8RR44+ev3IhalrdUdEUp/L34nb
         bechYiP9KXR/q4WILDnsknMoN0OH0sCVtyFtS0/Y6PWbo+AbE+13rClueC06VmWTO8w+
         hqh9w6yjZhN/+wn8IHBjoCdRQbnT74HYDBL19cFnL1+jpy9NxpojQU2q8evdeWRlGQzc
         YnCA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+EjrYU+JnVofHY/tSXTym09akey1tH/qEqBKncoWPJx4UTxjrK9a46P3d5Q5GdDUQ51ctz4aMHc0lIQDcqJW0q/umWMKmE3J
X-Gm-Message-State: AOJu0YxYbZfq6dhY8/Wm3AYQbU1AiMWqxTcXOhJae7xcOOb72RNH7eiy
	QEvnoBbc6bjBGOV4N1XL8Spv4ScKWEKOYo9aqGrduKY5zMdH4WpgubaxpZN2jto=
X-Google-Smtp-Source: AGHT+IFXHg3+bIeE3PdrJcijxHxZjXW/l6XMYN3dgqzEsXJC3I4bedjcyU3E2K4z08JfVJ9NAGFNqQ==
X-Received: by 2002:a17:90a:d512:b0:2a2:bbb9:c937 with SMTP id t18-20020a17090ad51200b002a2bbb9c937mr2871685pju.49.1712249845095;
        Thu, 04 Apr 2024 09:57:25 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::6:6984])
        by smtp.gmail.com with ESMTPSA id em16-20020a17090b015000b002a25f8e0b98sm1752266pjb.46.2024.04.04.09.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 09:57:24 -0700 (PDT)
Message-ID: <fae76581-bb19-43dd-a770-9a72a89e95ba@davidwei.uk>
Date: Thu, 4 Apr 2024 09:57:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v3 2/2] mlx5/core: Support max_io_eqs for a function
Content-Language: en-GB
To: Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, corbet@lwn.net, kalesh-anakkur.purayil@broadcom.com
Cc: saeedm@nvidia.com, leon@kernel.org, jiri@resnulli.us, shayd@nvidia.com,
 danielj@nvidia.com, dchumak@nvidia.com, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org
References: <20240403174133.37587-1-parav@nvidia.com>
 <20240403174133.37587-3-parav@nvidia.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240403174133.37587-3-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-03 10:41, Parav Pandit wrote:
> Implement get and set for the maximum IO event queues for SF and VF.
> This enables administrator on the hypervisor to control the maximum
> IO event queues which are typically used to derive the maximum and
> default number of net device channels or rdma device completion vectors.
> 
> Reviewed-by: Shay Drory <shayd@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v2->v3:
> - limited to 80 chars per line in devlink
> - fixed comments from Jakub in mlx5 driver to fix missing mutex unlock
>   on error path
> v1->v2:
> - fixed comments from Kalesh
> - fixed missing kfree in get call
> - returning error code for get cmd failure
> - fixed error msg copy paste error in set on cmd failure
> - limited code to 80 chars limit
> - fixed set function variables for reverse christmas tree
> ---
>  .../mellanox/mlx5/core/esw/devlink_port.c     |  4 +
>  .../net/ethernet/mellanox/mlx5/core/eswitch.h |  7 ++
>  .../mellanox/mlx5/core/eswitch_offloads.c     | 97 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c b/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> index d8e739cbcbce..f8869c9b6802 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> @@ -98,6 +98,8 @@ static const struct devlink_port_ops mlx5_esw_pf_vf_dl_port_ops = {
>  	.port_fn_ipsec_packet_get = mlx5_devlink_port_fn_ipsec_packet_get,
>  	.port_fn_ipsec_packet_set = mlx5_devlink_port_fn_ipsec_packet_set,
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +	.port_fn_max_io_eqs_get = mlx5_devlink_port_fn_max_io_eqs_get,
> +	.port_fn_max_io_eqs_set = mlx5_devlink_port_fn_max_io_eqs_set,
>  };
>  
>  static void mlx5_esw_offloads_sf_devlink_port_attrs_set(struct mlx5_eswitch *esw,
> @@ -143,6 +145,8 @@ static const struct devlink_port_ops mlx5_esw_dl_sf_port_ops = {
>  	.port_fn_state_get = mlx5_devlink_sf_port_fn_state_get,
>  	.port_fn_state_set = mlx5_devlink_sf_port_fn_state_set,
>  #endif
> +	.port_fn_max_io_eqs_get = mlx5_devlink_port_fn_max_io_eqs_get,
> +	.port_fn_max_io_eqs_set = mlx5_devlink_port_fn_max_io_eqs_set,
>  };
>  
>  int mlx5_esw_offloads_devlink_port_register(struct mlx5_eswitch *esw, struct mlx5_vport *vport)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
> index 349e28a6dd8d..50ce1ea20dd4 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
> @@ -573,6 +573,13 @@ int mlx5_devlink_port_fn_ipsec_packet_get(struct devlink_port *port, bool *is_en
>  int mlx5_devlink_port_fn_ipsec_packet_set(struct devlink_port *port, bool enable,
>  					  struct netlink_ext_ack *extack);
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +int mlx5_devlink_port_fn_max_io_eqs_get(struct devlink_port *port,
> +					u32 *max_io_eqs,
> +					struct netlink_ext_ack *extack);
> +int mlx5_devlink_port_fn_max_io_eqs_set(struct devlink_port *port,
> +					u32 max_io_eqs,
> +					struct netlink_ext_ack *extack);
> +
>  void *mlx5_eswitch_get_uplink_priv(struct mlx5_eswitch *esw, u8 rep_type);
>  
>  int __mlx5_eswitch_set_vport_vlan(struct mlx5_eswitch *esw,
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> index baaae628b0a0..2ad50634b401 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> @@ -66,6 +66,8 @@
>  
>  #define MLX5_ESW_FT_OFFLOADS_DROP_RULE (1)
>  
> +#define MLX5_ESW_MAX_CTRL_EQS 4
> +
>  static struct esw_vport_tbl_namespace mlx5_esw_vport_tbl_mirror_ns = {
>  	.max_fte = MLX5_ESW_VPORT_TBL_SIZE,
>  	.max_num_groups = MLX5_ESW_VPORT_TBL_NUM_GROUPS,
> @@ -4557,3 +4559,98 @@ int mlx5_devlink_port_fn_ipsec_packet_set(struct devlink_port *port,
>  	return err;
>  }
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +
> +int
> +mlx5_devlink_port_fn_max_io_eqs_get(struct devlink_port *port, u32 *max_io_eqs,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct mlx5_vport *vport = mlx5_devlink_port_vport_get(port);
> +	int query_out_sz = MLX5_ST_SZ_BYTES(query_hca_cap_out);
> +	u16 vport_num = vport->vport;
> +	struct mlx5_eswitch *esw;
> +	void *query_ctx;
> +	void *hca_caps;
> +	u32 max_eqs;
> +	int err;
> +
> +	esw = mlx5_devlink_eswitch_nocheck_get(port->devlink);
> +	if (!MLX5_CAP_GEN(esw->dev, vhca_resource_manager)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Device doesn't support VHCA management");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	query_ctx = kzalloc(query_out_sz, GFP_KERNEL);
> +	if (!query_ctx)
> +		return -ENOMEM;
> +
> +	mutex_lock(&esw->state_lock);
> +	err = mlx5_vport_get_other_func_cap(esw->dev, vport_num, query_ctx,
> +					    MLX5_CAP_GENERAL);
> +	if (err) {
> +		NL_SET_ERR_MSG_MOD(extack, "Failed getting HCA caps");
> +		goto out;
> +	}
> +
> +	hca_caps = MLX5_ADDR_OF(query_hca_cap_out, query_ctx, capability);
> +	max_eqs = MLX5_GET(cmd_hca_cap, hca_caps, max_num_eqs);
> +	if (max_eqs < MLX5_ESW_MAX_CTRL_EQS)
> +		*max_io_eqs = 0;
> +	else
> +		*max_io_eqs = max_eqs - MLX5_ESW_MAX_CTRL_EQS;
> +out:
> +	mutex_unlock(&esw->state_lock);
> +	kfree(query_ctx);
> +	return err;
> +}
> +
> +int
> +mlx5_devlink_port_fn_max_io_eqs_set(struct devlink_port *port, u32 max_io_eqs,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct mlx5_vport *vport = mlx5_devlink_port_vport_get(port);
> +	int query_out_sz = MLX5_ST_SZ_BYTES(query_hca_cap_out);
> +	u16 max_eqs = max_io_eqs + MLX5_ESW_MAX_CTRL_EQS;
> +	u16 vport_num = vport->vport;
> +	struct mlx5_eswitch *esw;
> +	void *query_ctx;
> +	void *hca_caps;
> +	int err;
> +
> +	esw = mlx5_devlink_eswitch_nocheck_get(port->devlink);
> +	if (!MLX5_CAP_GEN(esw->dev, vhca_resource_manager)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Device doesn't support VHCA management");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (max_io_eqs + MLX5_ESW_MAX_CTRL_EQS > USHRT_MAX) {

nit: this is the same as max_eqs

> +		NL_SET_ERR_MSG_MOD(extack, "Supplied value out of range");
> +		return -EINVAL;
> +	}
> +
> +	query_ctx = kzalloc(query_out_sz, GFP_KERNEL);
> +	if (!query_ctx)
> +		return -ENOMEM;
> +
> +	mutex_lock(&esw->state_lock);
> +	err = mlx5_vport_get_other_func_cap(esw->dev, vport_num, query_ctx,
> +					    MLX5_CAP_GENERAL);
> +	if (err) {
> +		NL_SET_ERR_MSG_MOD(extack, "Failed getting HCA caps");
> +		goto out;
> +	}
> +
> +	hca_caps = MLX5_ADDR_OF(query_hca_cap_out, query_ctx, capability);
> +	MLX5_SET(cmd_hca_cap, hca_caps, max_num_eqs, max_eqs);
> +
> +	err = mlx5_vport_set_other_func_cap(esw->dev, hca_caps, vport_num,
> +					    MLX5_SET_HCA_CAP_OP_MOD_GENERAL_DEVICE);
> +	if (err)
> +		NL_SET_ERR_MSG_MOD(extack, "Failed setting HCA caps");
> +
> +out:
> +	mutex_unlock(&esw->state_lock);
> +	kfree(query_ctx);
> +	return err;
> +}
