Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B673267B89
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302202; cv=pass; b=rSTMwqan8ZkszssZPrJBcjfAAKHeT2gBFezdTEI6MAnPcQK4gZxMufidN+BBx1SAE7WOyiLjeuYtQausigmtOczt6ESgq3pMPqpmjAj/Jn6PaE4k4i+tnlHgAmx3tk/Qss+F9dEDNyA4IfliC1iVeJCF45KFnWj2gq1ww6QCWm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302202; c=relaxed/simple;
	bh=5k6yqdBaTPSP5JPVkYb+f2wIlhX/CpftvOgPEkPmKT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtA4HzyquBBMs0OFwakd59WW3LMY35xGUNlSfbm9muovymW70tr9rwVWdfMwN96RXIwNxYyIECJqgicUHfyJjP7Adx4gaUIri0N+1UxmivV7lMUN6ND8a4dbReoG4MZJmRtMWprUKK1qej9P5P8h7Sjw9ZUoxveyECa9AZcx6Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJr43n2M; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJr43n2M"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0b1a48855so30875ad.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 15:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781302200; cv=none;
        d=google.com; s=arc-20240605;
        b=XUJqbCcBPMrQEBkK6a5IfKAmcCw+GPetvDxUiSx0TzotN361jjYmseQmxES9BBgHfR
         H0f1nNu0a+4Nl1xvgC9+W4LEjwzbf6933Wkmq9rMa1Iz5qR6NYBfY9rlHbs/sKQASF6F
         9B62/Fyl6xUnczDYf4E7PdM+AO8scFnCsVTq4M8HEgVktrnIlpk07k/V+fAU+kZjQZms
         8dTqGhGPxwOHuV7Qk3YoLa6a0HBSe41zQVxQk/nGrJ9gjIhFWcn/B5gDxVebF8av2F1J
         Lbyvtq2C6JjogUeEx6I5C7e9TsLDIK7YP1b06zZ3qj2ioAB3xRa/whX1yEWahvH5t/Yp
         vOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKE2ZtQnvdGOpkvugwRZpVP5AphORfxwr0s2buOnxRE=;
        fh=4FjwqodCddeO8tqpd/GTKGLeKFWkvOUyEkqENVJjzUs=;
        b=fRsLY9zPgNWMQKoZUQ3V501KTSBm+rJpZxyXRCm/bJVfL3uAZIRnG4pA+EWN0wihPt
         R266eVYQu1mbhIPnIdRkwqYod3t2m1N6ypR3N0+BhbKq25uP0ucaycYfxOpnJpYIGy0k
         ug3rYnDad4MUJ7xAVNp5EJYFmlnsf/sLQLJz9gp1pXzN1/tDOHI/Iwdttnv1lvELcEo7
         NvP51YQ/kEMpjnqpI0KZUPknxh8LXMfl9UT+XKyT9qNBgj4ZbX/D8aKERLsrCCTemgj0
         YjkzmMgoVl+RRI+jS4eVC1cByfxB5yyhwHSzxPVMviWX7EGPjiEkn8oJoTE58R3mbaNE
         vVOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781302200; x=1781907000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKE2ZtQnvdGOpkvugwRZpVP5AphORfxwr0s2buOnxRE=;
        b=ZJr43n2MOgFRmV07dlOC1GsD+ReS3ToltuX8ypbkPT4ts88jyLZzSnuIkq882hDbjW
         2G5EuOXxtLgAHu0s5th8ayeCg4tG3BkDeKX+ZqQyFYB4F6yNmAcea2GQKsPUOlBNa5M3
         +D8TGj+hR24ik3nf4wdMeFDF+1iHQ3MEbaPwWYLKpoge5XwnSJHNPbSPbY6O/9sw3LBK
         mxkdSAWsY+FiDOwbq6fXRZvnFhAYf+CI2h85kK4rSRYhYDKJzquO4jps2FP478Kv8/Te
         3S4A7L3IuamGDgvGN0dXeR9z0mxBnzzsMg+abXsZdvTS76RhtHyRCK1+LtTsE4CY41MO
         Jv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781302200; x=1781907000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKE2ZtQnvdGOpkvugwRZpVP5AphORfxwr0s2buOnxRE=;
        b=rRcVJ10UbsejsTltwOrje88yPNl3ttv9rszvpQfnmqqOrn5WCaZxzQ9goaNUwzcpWK
         ihEdMOu/DIrcsJftQNLCGV5FeQVho6vnb+XQ8gKpfsy04zG81HIUzthi1Wr3FLqDMydq
         0v3rLQuhbRfAAbgeCsyMJnL8SeiDRcrOLUrqUJuEn5VlUCVwLJheqv0wKX6/D4sKf3J3
         y2tqEX1nd6X3cAqgClAYQynXuz/d2+EmsEC4wG+Q0ojDxNnwRziMiYL2g7dHo1L7YAxd
         mR7HPR1nPDGzgmCCThhPZF8jDtZlFmJeXlEVzAGsToN2X0GYskNKv7Ty0UKHlqKAtwxN
         vKew==
X-Forwarded-Encrypted: i=1; AFNElJ9ICq25wJ6qPLZNenuHatZQDkDe5Vpqc4Fxmnim+6pWg7IWzWjlfsRfmrhWhKIEbt4yZZPM0WkxRl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HokeTtZqdxK55r0wM7zY/UO3yr7C6H1Fj6s32wOKa5Csp4+r
	W7bx1nGYBR2m/Xewnyc8B8uDk6pNCBNo5M9tq/DWmtb3rDWM5ypWW6pFK5xPZf9Mg23DAA6MIaw
	6tvSud2aCh1Z6tjX7k0xGWp+2kCYrDG3JVfzRe71v
X-Gm-Gg: Acq92OHBz/BS1ISg75JFl+8hiAvjRcKbnXCj3INr+MsVkan7HnAwuYSdz9HMGSwvcdZ
	Dz0xlGD49/DrngLjX525PGu3PjX7bhfJnVyPmNkLds9X1fnQXYAPcGzEfw6s2LT3GhFwMKNHBmJ
	3FSfD8OSSczA4wq5z2vAkXmcZl3x7HxkO0MvcOUwKo+qKE7CEvsVLdIfqgM1W8t63E6plrV5rfp
	O1z3bLyu2RsucJOWzTpC799qdchXUSwOpbQlbLp4vSOYZbVZuO/GTABPYqyLn/JgtMQwWc4izQ9
	A7CNI8ruujlmWMAy2hgTeUUKzfjaIgd/mZfkIkgNrHnP0KU/j5ItTJnbC/r0vljKGOCt7NauPb9
	AwXGD
X-Received: by 2002:a17:903:1a10:b0:2c1:ee6e:be21 with SMTP id
 d9443c01a7336-2c665ee29acmr325995ad.31.1781302199752; Fri, 12 Jun 2026
 15:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781062575.git.wudi234@huawei.com> <02e87952a65aa268526ade2f03de6c76fbc1fe9d.1781062575.git.wudi234@huawei.com>
In-Reply-To: <02e87952a65aa268526ade2f03de6c76fbc1fe9d.1781062575.git.wudi234@huawei.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Fri, 12 Jun 2026 15:09:48 -0700
X-Gm-Features: AVVi8CdxJqeMmSzjQ53v5Dn8_bpQQKd9-BdDzC2HB19TjFcuu-SZVS7l5rWXz3Y
Message-ID: <CAEAWyHe6np4FjBjckicWNQjJB7nf9s=EC6sTtMkJ6niyffmBCw@mail.gmail.com>
Subject: Re: [PATCH net-next v09 1/5] hinic3: Add ethtool queue ops
To: Fan Gong <gongfan1@huawei.com>
Cc: Wu Di <wudi234@huawei.com>, Teng Peisen <tengpeisen@huawei.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Mohsin Bashir <mohsin.bashr@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, luosifu <luosifu@huawei.com>, 
	Xin Guo <guoxin09@huawei.com>, Zhou Shuai <zhoushuai28@huawei.com>, 
	Wu Like <wulike1@huawei.com>, Shi Jing <shijing34@huawei.com>, 
	Zheng Jiezhen <zhengjiezhen@h-partners.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 12:05=E2=80=AFAM Fan Gong <gongfan1@huawei.com> wro=
te:
>
>   Implement following ethtool callback function:
> .get_ringparam
> .set_ringparam
>
>   These callbacks allow users to utilize ethtool for detailed
> queue depth configuration and monitoring.

The patch adds a new mutex. Would be good to call it out in the commit mess=
age.

>
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  .../ethernet/huawei/hinic3/hinic3_ethtool.c   |  93 ++++++++++++++++
>  .../net/ethernet/huawei/hinic3/hinic3_irq.c   |   5 +-
>  .../net/ethernet/huawei/hinic3/hinic3_main.c  |   6 +
>  .../huawei/hinic3/hinic3_netdev_ops.c         | 104 ++++++++++++++++--
>  .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |   9 ++
>  .../ethernet/huawei/hinic3/hinic3_nic_io.c    |   4 +-
>  .../ethernet/huawei/hinic3/hinic3_nic_io.h    |   8 +-
>  .../net/ethernet/huawei/hinic3/hinic3_rx.c    |   2 +-
>  8 files changed, 217 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c b/driver=
s/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> index 90fc16288de9..be9992a235f7 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> @@ -9,6 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/etherdevice.h>
>  #include <linux/netdevice.h>
> +#include <linux/netlink.h>
>  #include <linux/ethtool.h>
>
>  #include "hinic3_lld.h"
> @@ -409,6 +410,96 @@ hinic3_get_link_ksettings(struct net_device *netdev,
>         return 0;
>  }
>
> +static void hinic3_get_ringparam(struct net_device *netdev,
> +                                struct ethtool_ringparam *ring,
> +                                struct kernel_ethtool_ringparam *kernel_=
ring,
> +                                struct netlink_ext_ack *extack)
> +{
> +       struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
> +
> +       ring->rx_max_pending =3D HINIC3_MAX_RX_QUEUE_DEPTH;
> +       ring->tx_max_pending =3D HINIC3_MAX_TX_QUEUE_DEPTH;
> +       ring->rx_pending =3D nic_dev->q_params.rq_depth;
> +       ring->rx_pending =3D nic_dev->q_params.sq_depth;

copy-paste error

> +}
> +
> +static void hinic3_update_qp_depth(struct net_device *netdev,
> +                                  u32 sq_depth, u32 rq_depth)
> +{
> +       struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
> +       u16 i;
> +
> +       nic_dev->q_params.sq_depth =3D sq_depth;
> +       nic_dev->q_params.rq_depth =3D rq_depth;
> +       for (i =3D 0; i < nic_dev->max_qps; i++) {
> +               nic_dev->txqs[i].q_depth =3D sq_depth;
> +               nic_dev->txqs[i].q_mask =3D sq_depth - 1;
> +               nic_dev->rxqs[i].q_depth =3D rq_depth;
> +               nic_dev->rxqs[i].q_mask =3D rq_depth - 1;
> +       }
> +}
> +
> +static int hinic3_check_ringparam_valid(struct net_device *netdev,
> +                                       const struct ethtool_ringparam *r=
ing,
> +                                       struct netlink_ext_ack *extack)
> +{
> +       if (ring->tx_pending < HINIC3_MIN_QUEUE_DEPTH ||
> +           ring->rx_pending < HINIC3_MIN_QUEUE_DEPTH) {
> +               NL_SET_ERR_MSG_FMT_MOD(extack,
> +                                      "Queue depth out of range tx[%d-%d=
] rx[%d-%d]",
> +                                      HINIC3_MIN_QUEUE_DEPTH,
> +                                      HINIC3_MAX_TX_QUEUE_DEPTH,
> +                                      HINIC3_MIN_QUEUE_DEPTH,
> +                                      HINIC3_MAX_RX_QUEUE_DEPTH);

Consider updating this error message to only call out when the ring
sizes are below the minimum supported value - since that's the check
introduced here and also since ethtool core will reject any values
that are higher than the maximum supported ring sizes.

> +
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int hinic3_set_ringparam(struct net_device *netdev,
> +                               struct ethtool_ringparam *ring,
> +                               struct kernel_ethtool_ringparam *kernel_r=
ing,
> +                               struct netlink_ext_ack *extack)
> +{
> +       struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
> +       struct hinic3_dyna_txrxq_params q_params =3D {};
> +       u32 new_sq_depth, new_rq_depth;
> +       int err;
> +
> +       err =3D hinic3_check_ringparam_valid(netdev, ring, extack);
> +       if (err)
> +               return err;
> +
> +       new_sq_depth =3D 1U << ilog2(ring->tx_pending);
> +       new_rq_depth =3D 1U << ilog2(ring->rx_pending);

Why not use rounddown_pow_of_two()? More readable...

> +       if (new_sq_depth =3D=3D nic_dev->q_params.sq_depth &&
> +           new_rq_depth =3D=3D nic_dev->q_params.rq_depth)
> +               return 0;
> +
> +       if (new_sq_depth !=3D ring->tx_pending ||
> +           new_rq_depth !=3D ring->rx_pending)
> +               NL_SET_ERR_MSG_FMT_MOD(extack,
> +                                      "Requested Tx/Rx ring depth %u/%u =
trimmed to %u/%u",
> +                                      ring->tx_pending, ring->rx_pending=
,
> +                                      new_sq_depth, new_rq_depth);
> +
> +       if (!netif_running(netdev)) {
> +               hinic3_update_qp_depth(netdev, new_sq_depth, new_rq_depth=
);
> +       } else {
> +               q_params =3D nic_dev->q_params;
> +               q_params.sq_depth =3D new_sq_depth;
> +               q_params.rq_depth =3D new_rq_depth;
> +
> +               err =3D hinic3_change_channel_settings(netdev, &q_params)=
;
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct ethtool_ops hinic3_ethtool_ops =3D {
>         .supported_coalesce_params      =3D ETHTOOL_COALESCE_USECS |
>                                           ETHTOOL_COALESCE_PKT_RATE_RX_US=
ECS,
> @@ -417,6 +508,8 @@ static const struct ethtool_ops hinic3_ethtool_ops =
=3D {
>         .get_msglevel                   =3D hinic3_get_msglevel,
>         .set_msglevel                   =3D hinic3_set_msglevel,
>         .get_link                       =3D ethtool_op_get_link,
> +       .get_ringparam                  =3D hinic3_get_ringparam,
> +       .set_ringparam                  =3D hinic3_set_ringparam,
>  };
>
>  void hinic3_set_ethtool_ops(struct net_device *netdev)
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c b/drivers/ne=
t/ethernet/huawei/hinic3/hinic3_irq.c
> index e7d6c2033b45..bc4d879f9be4 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
> @@ -137,7 +137,8 @@ static int hinic3_set_interrupt_moder(struct net_devi=
ce *netdev, u16 q_id,
>         struct hinic3_interrupt_info info =3D {};
>         int err;
>
> -       if (q_id >=3D nic_dev->q_params.num_qps)
> +       if (q_id >=3D nic_dev->q_params.num_qps ||
> +           !mutex_trylock(&nic_dev->change_res_mutex))
>                 return 0;
>
>         info.interrupt_coalesc_set =3D 1;
> @@ -156,6 +157,8 @@ static int hinic3_set_interrupt_moder(struct net_devi=
ce *netdev, u16 q_id,
>                 nic_dev->rxqs[q_id].last_pending_limit =3D pending_limit;
>         }
>
> +       mutex_unlock(&nic_dev->change_res_mutex);
> +
>         return err;
>  }
>
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/n=
et/ethernet/huawei/hinic3/hinic3_main.c
> index 0a888fe4c975..c87624a5e5dc 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
> @@ -179,6 +179,7 @@ static int hinic3_sw_init(struct net_device *netdev)
>         int err;
>
>         mutex_init(&nic_dev->port_state_mutex);
> +       mutex_init(&nic_dev->change_res_mutex);
>
>         nic_dev->q_params.sq_depth =3D HINIC3_SQ_DEPTH;
>         nic_dev->q_params.rq_depth =3D HINIC3_RQ_DEPTH;
> @@ -315,6 +316,9 @@ static void hinic3_link_status_change(struct net_devi=
ce *netdev,
>  {
>         struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
>
> +       if (!mutex_trylock(&nic_dev->change_res_mutex))
> +               return;
> +
>         if (link_status_up) {
>                 if (netif_carrier_ok(netdev))
>                         return;
> @@ -330,6 +334,8 @@ static void hinic3_link_status_change(struct net_devi=
ce *netdev,
>                 netif_carrier_off(netdev);
>                 netdev_dbg(netdev, "Link is down\n");
>         }
> +
> +       mutex_unlock(&nic_dev->change_res_mutex);
>  }
>
>  static void hinic3_port_module_event_handler(struct net_device *netdev,
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/dri=
vers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> index da73811641a9..047214cfc753 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> @@ -288,7 +288,8 @@ static void hinic3_free_channel_resources(struct net_=
device *netdev,
>         hinic3_free_qps(nic_dev, qp_params);
>  }
>
> -static int hinic3_open_channel(struct net_device *netdev)
> +static int hinic3_prepare_channel(struct net_device *netdev,
> +                                 struct hinic3_dyna_txrxq_params *qp_par=
ams)
>  {
>         struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
>         int err;
> @@ -299,16 +300,28 @@ static int hinic3_open_channel(struct net_device *n=
etdev)
>                 return err;
>         }
>
> -       err =3D hinic3_configure_txrxqs(netdev, &nic_dev->q_params);
> +       err =3D hinic3_configure_txrxqs(netdev, qp_params);
>         if (err) {
>                 netdev_err(netdev, "Failed to configure txrxqs\n");
>                 goto err_free_qp_ctxts;
>         }
>
> +       return 0;
> +
> +err_free_qp_ctxts:
> +       hinic3_free_qp_ctxts(nic_dev);
> +
> +       return err;
> +}
> +
> +static int hinic3_open_channel(struct net_device *netdev)
> +{
> +       int err;
> +
>         err =3D hinic3_qps_irq_init(netdev);
>         if (err) {
>                 netdev_err(netdev, "Failed to init txrxq irq\n");
> -               goto err_free_qp_ctxts;
> +               return err;
>         }
>
>         err =3D hinic3_configure(netdev);
> @@ -321,8 +334,6 @@ static int hinic3_open_channel(struct net_device *net=
dev)
>
>  err_uninit_qps_irq:
>         hinic3_qps_irq_uninit(netdev);
> -err_free_qp_ctxts:
> -       hinic3_free_qp_ctxts(nic_dev);
>
>         return err;
>  }
> @@ -428,6 +439,74 @@ static void hinic3_vport_down(struct net_device *net=
dev)
>         }
>  }
>
> +int
> +hinic3_change_channel_settings(struct net_device *netdev,
> +                              struct hinic3_dyna_txrxq_params *trxq_para=
ms)
> +{
> +       struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
> +       struct hinic3_dyna_txrxq_params cur_trxq_params =3D {};
> +       struct hinic3_dyna_qp_params new_qp_params =3D {};
> +       struct hinic3_dyna_qp_params cur_qp_params =3D {};
> +       int err;
> +
> +       cur_trxq_params =3D nic_dev->q_params;
> +
> +       hinic3_config_num_qps(netdev, trxq_params);
> +
> +       err =3D hinic3_alloc_channel_resources(netdev, &new_qp_params,
> +                                            trxq_params);
> +       if (err) {
> +               netdev_err(netdev, "Failed to alloc channel resources\n")=
;
> +               return err;
> +       }
> +
> +       mutex_lock(&nic_dev->change_res_mutex);
> +       hinic3_vport_down(netdev);
> +       hinic3_close_channel(netdev);
> +       hinic3_get_cur_qps(nic_dev, &cur_qp_params);
> +
> +       hinic3_init_qps(nic_dev, &new_qp_params);
> +
> +       err =3D hinic3_prepare_channel(netdev, trxq_params);
> +       if (err)
> +               goto err_uninit_qps;
> +
> +       if (nic_dev->num_qp_irq > trxq_params->num_qps)
> +               hinic3_qp_irq_change(netdev, trxq_params->num_qps);
> +
> +       nic_dev->q_params =3D *trxq_params;
> +
> +       err =3D hinic3_open_channel(netdev);
> +       if (err)
> +               goto err_qp_irq_reset;
> +
> +       err =3D hinic3_vport_up(netdev);
> +       if (err)
> +               goto err_close_channel;
> +
> +       hinic3_free_channel_resources(netdev, &cur_qp_params, &cur_trxq_p=
arams);
> +
> +       mutex_unlock(&nic_dev->change_res_mutex);
> +
> +       return 0;
> +
> +err_close_channel:
> +       hinic3_close_channel(netdev);
> +err_qp_irq_reset:
> +       nic_dev->q_params =3D cur_trxq_params;
> +
> +       if (trxq_params->num_qps > cur_trxq_params.num_qps)
> +               hinic3_qp_irq_change(netdev, cur_trxq_params.num_qps);
> +       hinic3_free_qp_ctxts(nic_dev);
> +err_uninit_qps:
> +       hinic3_get_cur_qps(nic_dev, &new_qp_params);
> +       hinic3_free_channel_resources(netdev, &new_qp_params, trxq_params=
);
> +       hinic3_free_channel_resources(netdev, &cur_qp_params, &cur_trxq_p=
arams);
> +       mutex_unlock(&nic_dev->change_res_mutex);
> +
> +       return err;
> +}
> +
>  static int hinic3_open(struct net_device *netdev)
>  {
>         struct hinic3_nic_dev *nic_dev =3D netdev_priv(netdev);
> @@ -458,6 +537,10 @@ static int hinic3_open(struct net_device *netdev)
>
>         hinic3_init_qps(nic_dev, &qp_params);
>
> +       err =3D hinic3_prepare_channel(netdev, &nic_dev->q_params);
> +       if (err)
> +               goto err_uninit_qps;
> +
>         err =3D hinic3_open_channel(netdev);
>         if (err)
>                 goto err_uninit_qps;
> @@ -473,7 +556,7 @@ static int hinic3_open(struct net_device *netdev)
>  err_close_channel:
>         hinic3_close_channel(netdev);
>  err_uninit_qps:
> -       hinic3_uninit_qps(nic_dev, &qp_params);
> +       hinic3_get_cur_qps(nic_dev, &qp_params);
>         hinic3_free_channel_resources(netdev, &qp_params, &nic_dev->q_par=
ams);
>  err_destroy_num_qps:
>         hinic3_destroy_num_qps(netdev);
> @@ -493,10 +576,15 @@ static int hinic3_close(struct net_device *netdev)
>                 return 0;
>         }
>
> +       mutex_lock(&nic_dev->change_res_mutex);
>         hinic3_vport_down(netdev);
>         hinic3_close_channel(netdev);
> -       hinic3_uninit_qps(nic_dev, &qp_params);
> -       hinic3_free_channel_resources(netdev, &qp_params, &nic_dev->q_par=
ams);
> +       hinic3_get_cur_qps(nic_dev, &qp_params);
> +       hinic3_free_channel_resources(netdev, &qp_params,
> +                                     &nic_dev->q_params);
> +       hinic3_free_nicio_res(nic_dev);
> +       hinic3_destroy_num_qps(netdev);
> +       mutex_unlock(&nic_dev->change_res_mutex);
>
>         return 0;
>  }
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h b/driver=
s/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> index 9502293ff710..005b2c01a988 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> @@ -10,6 +10,9 @@
>  #include "hinic3_hw_cfg.h"
>  #include "hinic3_hwdev.h"
>  #include "hinic3_mgmt_interface.h"
> +#include "hinic3_nic_io.h"
> +#include "hinic3_tx.h"
> +#include "hinic3_rx.h"
>
>  #define HINIC3_VLAN_BITMAP_BYTE_SIZE(nic_dev)  (sizeof(*(nic_dev)->vlan_=
bitmap))
>  #define HINIC3_VLAN_BITMAP_SIZE(nic_dev)  \
> @@ -129,6 +132,8 @@ struct hinic3_nic_dev {
>         struct work_struct              rx_mode_work;
>         /* lock for enable/disable port */
>         struct mutex                    port_state_mutex;
> +       /* mutex to serialize channel/resource changes */
> +       struct mutex                    change_res_mutex;
>
>         struct list_head                uc_filter_list;
>         struct list_head                mc_filter_list;
> @@ -143,6 +148,10 @@ struct hinic3_nic_dev {
>
>  void hinic3_set_netdev_ops(struct net_device *netdev);
>  int hinic3_set_hw_features(struct net_device *netdev);
> +int
> +hinic3_change_channel_settings(struct net_device *netdev,
> +                              struct hinic3_dyna_txrxq_params *trxq_para=
ms);
> +
>  int hinic3_qps_irq_init(struct net_device *netdev);
>  void hinic3_qps_irq_uninit(struct net_device *netdev);
>
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c b/drivers=
/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> index 87e736adba02..0e7a0ccfba98 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> @@ -484,8 +484,8 @@ void hinic3_init_qps(struct hinic3_nic_dev *nic_dev,
>         }
>  }
>
> -void hinic3_uninit_qps(struct hinic3_nic_dev *nic_dev,
> -                      struct hinic3_dyna_qp_params *qp_params)
> +void hinic3_get_cur_qps(struct hinic3_nic_dev *nic_dev,
> +                       struct hinic3_dyna_qp_params *qp_params)
>  {
>         struct hinic3_nic_io *nic_io =3D nic_dev->nic_io;
>
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h b/drivers=
/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> index 12eefabcf1db..571b34d63950 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> @@ -14,6 +14,10 @@ struct hinic3_nic_dev;
>  #define HINIC3_RQ_WQEBB_SHIFT      3
>  #define HINIC3_SQ_WQEBB_SIZE       BIT(HINIC3_SQ_WQEBB_SHIFT)
>
> +#define HINIC3_MAX_TX_QUEUE_DEPTH  65536
> +#define HINIC3_MAX_RX_QUEUE_DEPTH  16384
> +#define HINIC3_MIN_QUEUE_DEPTH     128
> +
>  /* ******************** RQ_CTRL ******************** */
>  enum hinic3_rq_wqe_type {
>         HINIC3_NORMAL_RQ_WQE =3D 1,
> @@ -136,8 +140,8 @@ void hinic3_free_qps(struct hinic3_nic_dev *nic_dev,
>                      struct hinic3_dyna_qp_params *qp_params);
>  void hinic3_init_qps(struct hinic3_nic_dev *nic_dev,
>                      struct hinic3_dyna_qp_params *qp_params);
> -void hinic3_uninit_qps(struct hinic3_nic_dev *nic_dev,
> -                      struct hinic3_dyna_qp_params *qp_params);
> +void hinic3_get_cur_qps(struct hinic3_nic_dev *nic_dev,
> +                       struct hinic3_dyna_qp_params *qp_params);
>
>  int hinic3_init_qp_ctxts(struct hinic3_nic_dev *nic_dev);
>  void hinic3_free_qp_ctxts(struct hinic3_nic_dev *nic_dev);
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net=
/ethernet/huawei/hinic3/hinic3_rx.c
> index 309ab5901379..b5b601469517 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> @@ -541,7 +541,7 @@ int hinic3_configure_rxqs(struct net_device *netdev, =
u16 num_rq,
>                 rq_associate_cqes(rxq);
>
>                 pkts =3D hinic3_rx_fill_buffers(rxq);
> -               if (!pkts) {
> +               if (pkts < rxq->q_depth - 1) {
>                         netdev_err(netdev, "Failed to fill Rx buffer\n");
>                         return -ENOMEM;
>                 }
> --
> 2.43.0
>
>
