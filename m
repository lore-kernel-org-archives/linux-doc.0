Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E33AB294
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550313; cv=none; b=nmRhIaVnrB/xP5YW2D5+sTJshC1ei2rTzdePYaHI7npgSgKoXHesuSbWsl9G5bpZj/0YhCHFAfJgZDNQhTik/oTEfMcYCeBq7X9iJicTPevY/mTQ3XWOshMdMkST2V/kvMROQ0G1kj5qdWD8OLCkEFbYX4+cJILG45ZQnVPMqkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550313; c=relaxed/simple;
	bh=XF3E18nmYlywzGZHugMrUwe1UFFyFbJmWKz1vmcxNK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEuoyHvdEVZUn4MhkNXlv/Ny5+VJLMOW4LfcLRwsJtLJnOLx40/95XfNsmpA3L9POJr9q0FGpVlhVgNZPduEpNCccaPxi1vu31g8Bw1pIS0sE64eptVJdiEbkmpt2UmrznQK2/p0DLoQ2fIIARn9mewyhdsxEAYxPsxqy+lyLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+7zj1d/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ltleVQKt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+7zj1d/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ltleVQKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777550310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=thwF8C1OV3A1j1cbf6uqLV/XzGN3xgA1qUzmi0EblXc=;
	b=a+7zj1d/UQD8RRiFttz+K/JFWx2Bmx1B8JsK/fUFfZ0QiqrPn6bZF3LM0GYlIbbUOyzxjD
	ueEzX4IUFuQw00u/Od/9z5j4HO85X++on2k6+RIvRzP5BMfVAoUW41LlJdEj2gaKQqpmLP
	mpLPdpRTXJf7huIWWSwDmB4jO9CaqKw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-t9LcibyRONODbHO50Ka1IA-1; Thu, 30 Apr 2026 07:58:29 -0400
X-MC-Unique: t9LcibyRONODbHO50Ka1IA-1
X-Mimecast-MFC-AGG-ID: t9LcibyRONODbHO50Ka1IA_1777550308
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a5c837c44so6033315e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777550308; x=1778155108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thwF8C1OV3A1j1cbf6uqLV/XzGN3xgA1qUzmi0EblXc=;
        b=ltleVQKtVK99EFl/wCouYDFLvd8XCSy+HF9ULr2oPfTXjwux1MTgzhYUv+q3Lv/AfP
         GwjVN5j6SRZs+27Io6n3ZAkn4DLEO/7/QJxZutHXm7i5mIMzwXqxZDGRA+gHtfhpGhYd
         lCvcvSjps40x2RBYx6LSCPH3M2FS5mFckWUJOliUPUSQSwdxO5tX+2YlRBKf68EGSwal
         pRIKv5O4Rc+Lhfgw02l0/QrKGcW3zA+DnntDY6BDOPVVdONfSIiPWDFTYUMHmcyLua9J
         vR7GYm+qE6tLO253DM4juNJorKfaAkNGAEw1RluU/0P2tENPZSj5nOtNmrvMKOhmEGfu
         /7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550308; x=1778155108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thwF8C1OV3A1j1cbf6uqLV/XzGN3xgA1qUzmi0EblXc=;
        b=tBpe5idleWcHrbqBpOyw6t0MYWHChxQezYvCiUCEb9byPDztEYF11DPgXtHIRJWSUp
         ZXuf2kEWH9SiR/NXrzluBI2pFcY21O9kNfaAa5KjUaTjVst/AjVMYKhHvurKvJDkeclw
         CDCtB+cNuoDEvulAc8+Tv2tR1pCCCyUH4jcU2Rv4HLB1XqOOcpwiVzhziLebrshhWZX4
         fkg1kOkGZgM+LCGxe7lJ7N2JkQCixwOZJkcromWaFaBXyx6H7Vb0RwIwPlDItvXocsBN
         PFU1J1zaddy+3nX3hVilCadMNc4qvGPISUVKgtrobhQuLwyN+wpG/1FvHJyUUJUu+Xvv
         K54A==
X-Forwarded-Encrypted: i=1; AFNElJ/58qqYM8e4kxHnduXSNRBxprrNGvRcDHxQJK1Mk7DcKXiblKzCPTsJ8nTMuZ1v8jDXRMfmlNs8vHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcA47xErDpVTOhs7WbDDwyaCox4ht2/r8rKgUrA/n4CPfuyZR
	KHrt+fkV7pBqjSJejQYmJNfQB9pdV0gkrgIHeawIj/r/k2GCbbNvZFYDObQxZQwsU3eJIjVwaAf
	Opr0NR9/+fp/20WvWrZA+uYVOWAhWxdvHtJuqgwofflfNAN6/t1500zelsQ9IUg==
X-Gm-Gg: AeBDievvjpkFbnxZ0Zy7zzgbPv9BAzVwAncVv3zyzqD4lpdOkljM3GQqUZddJuaIb47
	jAVqTNjl/pflRr0kLrB+f6f/VRsob31+ODRmp0OLkAt43FUfzZyz/oBp5NupP/9iZshar6GqBVI
	gcHXhmPmQ++Z03AbIRs9Oq6TKlYivAMThBNOrMAmsQB4MluUimg36bZzjBYZLaPJ0RZhdzADkaB
	GMcvflWL0FI3hQDubbJrPpNth9Vb5HPuLyr5vGzyoesbw0tlYO9TYZZCdTeXbnPA0NPuWfLHzK5
	8LQba8Ty+ln3r9LR2iVtOwj/gNFJQJ/+yDXNVvGpPpOBYTTv2W2XqbjgQGJUERbXgTcrc7OzGPV
	ILxNPdojf+FrjJfCho+7VGrtszhxkaYk=
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr46368355e9.8.1777550307752;
        Thu, 30 Apr 2026 04:58:27 -0700 (PDT)
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr46367725e9.8.1777550307171;
        Thu, 30 Apr 2026 04:58:27 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2e8a6csm62484295e9.5.2026.04.30.04.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 04:58:26 -0700 (PDT)
Message-ID: <16ad2e01-a3a9-4d03-924a-fc36e17beb02@redhat.com>
Date: Thu, 30 Apr 2026 13:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dpll: add pin operational state
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Michal Schmidt <mschmidt@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Pasi Vaananen <pvaanane@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428154907.2820654-1-ivecera@redhat.com>
 <20260428154907.2820654-2-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260428154907.2820654-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/28/26 17:49, Ivan Vecera wrote:
> Add pin-operstate enum and operstate_on_dpll_get callback to report
> the actual hardware status of a pin with respect to its parent DPLL
> device. Unlike pin-state (which reflects administrative intent set
> by the user), operstate reflects what the hardware is actually doing.
>
> Defined operational states:
>    - active: pin is qualified and actively used by the DPLL
>    - standby: pin is qualified but not actively used by the DPLL
>    - no-signal: pin does not have a valid signal
>    - qual-failed: pin signal failed qualification
>
> The operstate is reported inside the pin-parent-device nested
> attribute alongside the existing state and phase-offset attributes.
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   Documentation/driver-api/dpll.rst     | 38 ++++++++++++++++-----------
>   Documentation/netlink/specs/dpll.yaml | 31 ++++++++++++++++++++++
>   drivers/dpll/dpll_netlink.c           | 27 +++++++++++++++++++
>   drivers/dpll/dpll_nl.c                |  3 ++-
>   drivers/dpll/dpll_nl.h                |  2 +-
>   include/linux/dpll.h                  |  6 +++++
>   include/uapi/linux/dpll.h             | 23 ++++++++++++++++
>   7 files changed, 113 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
> index 93c191b2d0898..37eaef785e304 100644
> --- a/Documentation/driver-api/dpll.rst
> +++ b/Documentation/driver-api/dpll.rst
> @@ -65,35 +65,43 @@ request, where user provides attributes that result in single pin match.
>   Pin selection
>   =============
>   
> -In general, selected pin (the one which signal is driving the dpll
> -device) can be obtained from ``DPLL_A_PIN_STATE`` attribute, and only
> -one pin shall be in ``DPLL_PIN_STATE_CONNECTED`` state for any dpll
> -device.
> +Pin state (``DPLL_A_PIN_STATE``) reflects the administrative intent set
> +by the user. Pin operational state (``DPLL_A_PIN_OPERSTATE``) reflects
> +what the hardware is actually doing with the pin.
>   
>   Pin selection can be done either manually or automatically, depending
>   on hardware capabilities and active dpll device work mode
>   (``DPLL_A_MODE`` attribute). The consequence is that there are
> -differences for each mode in terms of available pin states, as well as
> -for the states the user can request for a dpll device.
> +differences for each mode in terms of available pin states the user can
> +request for a dpll device.
>   
> -In manual mode (``DPLL_MODE_MANUAL``) the user can request or receive
> -one of following pin states:
> +In manual mode (``DPLL_MODE_MANUAL``) the user can request one of
> +following pin states:
>   
> -- ``DPLL_PIN_STATE_CONNECTED`` - the pin is used to drive dpll device
> -- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin is not used to drive dpll
> +- ``DPLL_PIN_STATE_CONNECTED`` - the pin is selected to drive dpll
>     device
> +- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin is not selected to drive
> +  dpll device
>   
> -In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can request or
> -receive one of following pin states:
> +In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can request one of
> +following pin states:
>   
>   - ``DPLL_PIN_STATE_SELECTABLE`` - the pin shall be considered as valid
>     input for automatic selection algorithm
>   - ``DPLL_PIN_STATE_DISCONNECTED`` - the pin shall be not considered as
>     a valid input for automatic selection algorithm
>   
> -In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can only receive
> -pin state ``DPLL_PIN_STATE_CONNECTED`` once automatic selection
> -algorithm locks a dpll device with one of the inputs.
> +The actual hardware status of a pin is reported via the operational
> +state (``DPLL_A_PIN_OPERSTATE``) attribute nested under the parent
> +device:
> +
> +- ``DPLL_PIN_OPERSTATE_ACTIVE`` - pin is qualified and actively used
> +  by the DPLL
> +- ``DPLL_PIN_OPERSTATE_STANDBY`` - pin is qualified but not actively
> +  used by the DPLL
> +- ``DPLL_PIN_OPERSTATE_NO_SIGNAL`` - pin does not have a valid signal
> +- ``DPLL_PIN_OPERSTATE_QUAL_FAILED`` - pin signal failed qualification
> +  checks
>   
>   Shared pins
>   ===========
> diff --git a/Documentation/netlink/specs/dpll.yaml b/Documentation/netlink/specs/dpll.yaml
> index 40465a3d7fc20..c45de70a47ce6 100644
> --- a/Documentation/netlink/specs/dpll.yaml
> +++ b/Documentation/netlink/specs/dpll.yaml
> @@ -212,6 +212,27 @@ definitions:
>           name: selectable
>           doc: pin enabled for automatic input selection
>       render-max: true
> +  -
> +    type: enum
> +    name: pin-operstate
> +    doc: |
> +      defines possible operational states of a pin with respect to its
> +      parent DPLL device, valid values for DPLL_A_PIN_OPERSTATE attribute
> +    entries:
> +      -
> +        name: active
> +        doc: pin is qualified and actively used by the DPLL
> +        value: 1
> +      -
> +        name: standby
> +        doc: pin is qualified but not actively used by the DPLL
> +      -
> +        name: no-signal
> +        doc: pin does not have a valid signal
> +      -
> +        name: qual-failed
> +        doc: pin signal failed qualification (e.g. frequency or phase monitor)
> +    render-max: true
>     -
>       type: flags
>       name: pin-capabilities
> @@ -488,6 +509,14 @@ attribute-sets:
>             Value of (DPLL_A_PIN_MEASURED_FREQUENCY %
>             DPLL_PIN_MEASURED_FREQUENCY_DIVIDER) is a fractional part
>             of a measured frequency value.
> +      -
> +        name: operstate
> +        type: u32
> +        enum: pin-operstate
> +        doc: |
> +          Operational state of the pin with respect to its parent DPLL
> +          device. Unlike state (which reflects the administrative intent),
> +          operstate reflects the actual hardware status.
>   
>     -
>       name: pin-parent-device
> @@ -501,6 +530,8 @@ attribute-sets:
>           name: prio
>         -
>           name: state
> +      -
> +        name: operstate
>         -
>           name: phase-offset
>     -
> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
> index af7ce62ec55ca..05cf946b4be5e 100644
> --- a/drivers/dpll/dpll_netlink.c
> +++ b/drivers/dpll/dpll_netlink.c
> @@ -324,6 +324,30 @@ dpll_msg_add_pin_on_dpll_state(struct sk_buff *msg, struct dpll_pin *pin,
>   	return 0;
>   }
>   
> +static int
> +dpll_msg_add_pin_operstate(struct sk_buff *msg, struct dpll_pin *pin,
> +			   struct dpll_pin_ref *ref,
> +			   struct netlink_ext_ack *extack)
> +{
> +	const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
> +	struct dpll_device *dpll = ref->dpll;
> +	enum dpll_pin_operstate operstate;
> +	int ret;
> +
> +	if (!ops->operstate_on_dpll_get)
> +		return 0;
> +	ret = ops->operstate_on_dpll_get(pin,
> +					  dpll_pin_on_dpll_priv(dpll, pin),
> +					  dpll, dpll_priv(dpll),
> +					  &operstate, extack);
> +	if (ret)
> +		return ret;
> +	if (nla_put_u32(msg, DPLL_A_PIN_OPERSTATE, operstate))
> +		return -EMSGSIZE;
> +
> +	return 0;
> +}
> +
>   static int
>   dpll_msg_add_pin_direction(struct sk_buff *msg, struct dpll_pin *pin,
>   			   struct dpll_pin_ref *ref,
> @@ -650,6 +674,9 @@ dpll_msg_add_pin_dplls(struct sk_buff *msg, struct dpll_pin *pin,
>   		if (ret)
>   			goto nest_cancel;
>   		ret = dpll_msg_add_pin_on_dpll_state(msg, pin, ref, extack);
> +		if (ret)
> +			goto nest_cancel;
> +		ret = dpll_msg_add_pin_operstate(msg, pin, ref, extack);
>   		if (ret)
>   			goto nest_cancel;
>   		ret = dpll_msg_add_pin_prio(msg, pin, ref, extack);
> diff --git a/drivers/dpll/dpll_nl.c b/drivers/dpll/dpll_nl.c
> index 1e652340a5d73..58235845fa3d5 100644
> --- a/drivers/dpll/dpll_nl.c
> +++ b/drivers/dpll/dpll_nl.c
> @@ -12,11 +12,12 @@
>   #include <uapi/linux/dpll.h>
>   
>   /* Common nested types */
> -const struct nla_policy dpll_pin_parent_device_nl_policy[DPLL_A_PIN_PHASE_OFFSET + 1] = {
> +const struct nla_policy dpll_pin_parent_device_nl_policy[DPLL_A_PIN_OPERSTATE + 1] = {
>   	[DPLL_A_PIN_PARENT_ID] = { .type = NLA_U32, },
>   	[DPLL_A_PIN_DIRECTION] = NLA_POLICY_RANGE(NLA_U32, 1, 2),
>   	[DPLL_A_PIN_PRIO] = { .type = NLA_U32, },
>   	[DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U32, 1, 3),
> +	[DPLL_A_PIN_OPERSTATE] = NLA_POLICY_RANGE(NLA_U32, 1, 4),
>   	[DPLL_A_PIN_PHASE_OFFSET] = { .type = NLA_S64, },
>   };
>   
> diff --git a/drivers/dpll/dpll_nl.h b/drivers/dpll/dpll_nl.h
> index 7419679b69779..fa8280e3dd14c 100644
> --- a/drivers/dpll/dpll_nl.h
> +++ b/drivers/dpll/dpll_nl.h
> @@ -13,7 +13,7 @@
>   #include <uapi/linux/dpll.h>
>   
>   /* Common nested types */
> -extern const struct nla_policy dpll_pin_parent_device_nl_policy[DPLL_A_PIN_PHASE_OFFSET + 1];
> +extern const struct nla_policy dpll_pin_parent_device_nl_policy[DPLL_A_PIN_OPERSTATE + 1];
>   extern const struct nla_policy dpll_pin_parent_pin_nl_policy[DPLL_A_PIN_STATE + 1];
>   extern const struct nla_policy dpll_reference_sync_nl_policy[DPLL_A_PIN_STATE + 1];
>   
> diff --git a/include/linux/dpll.h b/include/linux/dpll.h
> index b7277a8b484d2..b6f16c884b99e 100644
> --- a/include/linux/dpll.h
> +++ b/include/linux/dpll.h
> @@ -85,6 +85,12 @@ struct dpll_pin_ops {
>   				 const struct dpll_device *dpll,
>   				 void *dpll_priv, enum dpll_pin_state *state,
>   				 struct netlink_ext_ack *extack);
> +	int (*operstate_on_dpll_get)(const struct dpll_pin *pin,
> +				     void *pin_priv,
> +				     const struct dpll_device *dpll,
> +				     void *dpll_priv,
> +				     enum dpll_pin_operstate *operstate,
> +				     struct netlink_ext_ack *extack);
>   	int (*state_on_pin_set)(const struct dpll_pin *pin, void *pin_priv,
>   				const struct dpll_pin *parent_pin,
>   				void *parent_pin_priv,
> diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
> index 871685f7c353b..cb363cccf2e2a 100644
> --- a/include/uapi/linux/dpll.h
> +++ b/include/uapi/linux/dpll.h
> @@ -178,6 +178,28 @@ enum dpll_pin_state {
>   	DPLL_PIN_STATE_MAX = (__DPLL_PIN_STATE_MAX - 1)
>   };
>   
> +/**
> + * enum dpll_pin_operstate - defines possible operational states of a pin with
> + *   respect to its parent DPLL device, valid values for DPLL_A_PIN_OPERSTATE
> + *   attribute
> + * @DPLL_PIN_OPERSTATE_ACTIVE: pin is qualified and actively used by the DPLL
> + * @DPLL_PIN_OPERSTATE_STANDBY: pin is qualified but not actively used by the
> + *   DPLL
> + * @DPLL_PIN_OPERSTATE_NO_SIGNAL: pin does not have a valid signal
> + * @DPLL_PIN_OPERSTATE_QUAL_FAILED: pin signal failed qualification (e.g.
> + *   frequency or phase monitor)
> + */
> +enum dpll_pin_operstate {
> +	DPLL_PIN_OPERSTATE_ACTIVE = 1,
> +	DPLL_PIN_OPERSTATE_STANDBY,
> +	DPLL_PIN_OPERSTATE_NO_SIGNAL,
> +	DPLL_PIN_OPERSTATE_QUAL_FAILED,
> +
> +	/* private: */
> +	__DPLL_PIN_OPERSTATE_MAX,
> +	DPLL_PIN_OPERSTATE_MAX = (__DPLL_PIN_OPERSTATE_MAX - 1)
> +};
> +
>   /**
>    * enum dpll_pin_capabilities - defines possible capabilities of a pin, valid
>    *   flags on DPLL_A_PIN_CAPABILITIES attribute
> @@ -257,6 +279,7 @@ enum dpll_a_pin {
>   	DPLL_A_PIN_PHASE_ADJUST_GRAN,
>   	DPLL_A_PIN_FRACTIONAL_FREQUENCY_OFFSET_PPT,
>   	DPLL_A_PIN_MEASURED_FREQUENCY,
> +	DPLL_A_PIN_OPERSTATE,
>   
>   	__DPLL_A_PIN_MAX,
>   	DPLL_A_PIN_MAX = (__DPLL_A_PIN_MAX - 1)

Reviewed-by: Petr Oros <poros@redhat.com>


